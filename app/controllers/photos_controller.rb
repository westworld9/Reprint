class PhotosController < ApplicationController 
  def create
    @post = Post.find(params[:post_id])

    if params[:images]
      params[:images].each do |img|
        @post.photos.create(image: img)
      end

      @photos = @post.photos
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
    
    def destroy 
      @photo=Photo.find(params[:id])
      @post = @photo.post
      
      @photo.destroy 
      @photos=Photo.where(post_id: @post.id)
      
      respond_to :js
    end
  end
end
