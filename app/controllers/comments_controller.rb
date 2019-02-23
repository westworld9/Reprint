class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all.reverse_order
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(content: params[:comment][:content], post_id:params[:post_id])
    respond_to do |format|
      if @comment.save
        format.js{ render :index }
      else
        format.html{ redirect_to post_path(@post.id), notice: "投稿に失敗しました" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      @comment.destroy
      format.js{ render :index }
    end
  end
end
