class AlbumsController < ApplicationController
  respond_to :html, :xml, :json
  
  def new
   @artist = Artist.find(params[:artist_id])
   @album = @artist.albums.build
   respond_with(@album)
  end
  
  def create
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.create(album_params)
    redirect_to user_albums_path
  end
  
  def index
    @user = User.find(params[:user_id])
    
    
  end
  
  def edit
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:id])
    respond_with(@album)
  end
  
  def update
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:id])
    
    if 
      @album.update(album_params)
      redirect_to user_albums_path(@user)
    else
      render "edit"
    end
  end
   
  def show
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:id])
    respond_with(@album)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @album = @user.albums.find(params[:id])
    @album.destroy
    redirect_to user_albums_path(@user)
  end
  
  private 
  
  def album_params
    params.require(:album).permit(:title, :author, :description)
  end
end
