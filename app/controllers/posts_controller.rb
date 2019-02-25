class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :description, :photo_upload,:video, :update, :destroy]
  before_action :correct_user, only: [:description, :photo_upload, :video,:update, :destroy]
  
  def index 
    @q = Post.ransack(params[:q])
    @posts = @q.result.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end
  
  def create 
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to photo_upload_post_path(@post)
    else
      render :new
    end
  end

  def show
    @photos = @post.photos
    @comments = Comment.where(post_id: @post.id)
    
    if user_signed_in?
      @comment = current_user.comments.build
      @favorite = current_user.favorites.find_by(post_id: @post.id)
    end
  end

  def edit
  end
  
  def description
  end
  
  def photo_upload
    @photos=@post.photos
  end 
  
  def video 
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Saved"
    else 
      flash[:alert] = "いくつか間違いがあります"
    end 
    redirect_back(fallback_location: request.referer)
  end
  
  def destroy
    @post.destroy
    redirect_to root_path, notice: "投稿が削除されました"
  end
  
  private 
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def correct_user
    unless current_user.id == @post.user.id
      redirect_to root_path, notice: '権限がありません'
    end
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :description, :category, :genre, :url)
  end
end
