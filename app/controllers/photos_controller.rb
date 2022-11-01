class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def index
    @photos = Photo.where(user_id: @current_user.id).order(created_at: :desc)
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
