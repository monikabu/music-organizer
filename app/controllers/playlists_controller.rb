class PlaylistsController < ApplicationController
 respond_to :html, :xml, :json
  
  def new
   @user = User.find(params[:user_id])
   @playlist = @user.playlists.build
   respond_with(@playlist)
  end
  
  def create
    @user = User.find(params[:user_id])
    @playlist = @user.playlists.create(playlist_params)
    redirect_to user_playlists_path
  end
  
  def index
    @user = User.find(params[:user_id])
    @playlists = @user.playlists.all
  end
  
  def edit
    @user = User.find(params[:user_id])
    @playlist = @user.playlists.find(params[:id])
    respond_with(@playlist)
  end
  
  def update
    @user = User.find(params[:user_id])
    @playlist = @user.playlists.find(params[:id])
    
    if 
      @playlist.update(playlist_params)
      redirect_to user_playlists_path(@user)
    else
      render "edit"
    end
  end
  
  def show
    @user = User.find(params[:user_id])
    @playlist = @user.playlists.find(params[:id])
    respond_with(@playlist)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @playlist = @user.playlists.find(params[:id])
    @playlist.destroy
    redirect_to user_playlists_path(@user)
  end
  
  private 
  
  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
