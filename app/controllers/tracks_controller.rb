class TracksController < ApplicationController
  respond_to :html, :xml, :json
  
  def new
   @album = Album.find(params[:album_id])
   @track = @album.tracks.build
   respond_with(@track)
  end
  
  def create
    @album = Album.find(params[:album_id])
    @track = @album.tracks.create(track_params)
    redirect_to album_tracks_path
  end
  
  def index
    @album = Album.find(params[:album_id])
    @track = @album.tracks.all
  end
  
  def edit
    @album = Album.find(params[:album_id])
    @track = @album.tracks.find(params[:id])
    respond_with(@track)
  end
  
  def update
    @album = Album.find(params[:album_id])
    @track = @album.tracks.find(params[:id])
    
    if 
      @track.update(track_params)
      redirect_to album_tracks_path(@album)
    else
      render "edit"
    end
  end
  
  def show
    @album = Album.find(params[:album_id])
    @track = @album.tracks.find(params[:id])
    respond_with(@track)
  end
  
  def destroy
    @album = Album.find(params[:album_id])
    @track = @album.tracks.find(params[:id])
    @track.destroy
    redirect_to album_tracks_path(@album)
  end
  
  private 
  
  def track_params
    params.require(:track).permit(:title)
  end
end
