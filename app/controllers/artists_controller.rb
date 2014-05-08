class ArtistsController < ApplicationController
  respond_to :html, :xml, :json
  def index
    @user = User.find(current_user.id)
    @artist = @user.artists.all
  end
  def new
    @user = User.find(current_user.id)
    @artist = @user.artists.new
  end
  
  def create
    @user = User.find(current_user.id)
    @artist =  @user.artists.create(artist_params)
    redirect_to new_artist_album_path(@artist)
  end
  
   def edit
    @user = User.find(current_user.id)
    @artist = @user.artists.find(params[:id])
    respond_with(@artist)
  end
  
  def update
    @user = User.find(current_user.id)
    @artist = @user.artists.find(params[:id])
    
    if 
      @artist.update(artist_params)
      redirect_to user_artists_path(@user)
    else
      render "edit"
    end
  end
  
  def show
    @user = User.find(current_user.id)
    @artist = @user.artists.find(params[:id])
  end
   
  def destroy
    @user = User.find(current_user.id)
    @artist = @user.artists.find(params[:id])
    @artist.destroy
    redirect_to user_artists_path(@user)
  end
  
  private
  def artist_params
    params.require(:artist).permit(:name)
  end
end
