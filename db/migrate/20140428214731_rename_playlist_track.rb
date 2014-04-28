class RenamePlaylistTrack < ActiveRecord::Migration
  
    def self.up
    rename_table :playlist_tracks, :playlists_tracks
    end

    def self.down
      rename_table :playlists_tracks, :playlist_tracks
    end
end

