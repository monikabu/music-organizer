class ArtistsController < ApplicationController
  
  def index
    
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
  
  private
  def artist_params
    params.require(:artist).permit(:name)
  end
end
