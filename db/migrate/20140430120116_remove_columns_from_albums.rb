class RemoveColumnsFromAlbums < ActiveRecord::Migration
  def change
    remove_column :albums, :description, :string
    remove_column :albums, :author, :string
  end
end
