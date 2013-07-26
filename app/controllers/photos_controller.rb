class PhotosController < ApplicationController

  def new
  end

  def create
    @user = current_user
    @photo = Photo.create!(params[:photo])
    render :json => @photo
  end


  def show
    @photo = Photo.find(params[:id])
    render :json => @photo
  end

  def index
    @photos = Photo.where(:user_id => params[:user_id])

    respond_to do |format|
      format.json {render :json => @photos}
      format.html {render :html => @photos}
    end
  end


end