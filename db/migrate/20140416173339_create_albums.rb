class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :author
      t.references :playlist, index: true

      t.timestamps
    end
  end
end
