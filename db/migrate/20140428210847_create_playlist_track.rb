class CreatePlaylistTrack < ActiveRecord::Migration
  def change
    create_table :playlist_tracks, id: false do |t|
      t.belongs_to :playlist
      t.belongs_to :track
    end
  end
end
