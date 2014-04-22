class RemoveReferencesFromAlbums < ActiveRecord::Migration
  def change
    remove_reference :albums, :playlist, index: true
  end
end
