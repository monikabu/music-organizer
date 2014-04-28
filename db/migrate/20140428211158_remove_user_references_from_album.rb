class RemoveUserReferencesFromAlbum < ActiveRecord::Migration
  def change
    remove_reference :albums, :user, index: true
  end
end
