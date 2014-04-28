class MainPageController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:user_id])
    @playlist = @user.playlists(params[:id])
  end
  
end
