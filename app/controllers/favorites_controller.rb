class FavoritesController < ApplicationController
  before_action :login_user
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(post_id: params[:post_id])
    @favorite.save
    redirect_to post_path(@post)
  end

  def destroy 
    @post = Post.find(params[:id])
    @favorite = current_user.favorites.find_by(post_id: params[:id])
    @favorite.destroy
    redirect_to post_path(@post)
    
  end
  private 
  
  def login_user 
    if current_user.nil?  
      redirect_to new_user_session_path, alert: "ログインしてください"
    end
  end
end 