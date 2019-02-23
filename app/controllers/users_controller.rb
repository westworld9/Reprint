class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @posts=@user.posts
    @favorites=@user.favorites
  end
end
