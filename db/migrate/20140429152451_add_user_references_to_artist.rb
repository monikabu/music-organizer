class AddUserReferencesToArtist < ActiveRecord::Migration
  def change
    add_reference :artists, :user, index: true
  end
end
