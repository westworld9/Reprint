class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_coversation

  def index
    if current_user == @conversation.sender || current_user == @conversation.recipient 
      @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender 
      @messages = @conversation.messages.order("created_at DESC")
    else
      redirect_to conversations_path, alert: "権限がありません"
    end
  end

  def create
    @message = @conversation.messages.build(message_params)
    @messages = @conversation.messages.order("created_at DESC")
    
    if @message.save
      ActionCable.server.broadcast "conversation_#{@conversation.id}", message: render_message(@message)
    end
  end

  private

  def render_message(message)
    self.render(partial: 'messages/message', locals: {message: message})
  end
  def set_coversation 
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
