class ChangeAttributes < ActiveRecord::Migration
  def change
    rename_column :artists, :name, :artist_name
    rename_column :albums, :title, :album_title
    rename_column :songs, :title, :song_title
    add_column :songs, :artist_id, :integer
    remove_column :albums, :artist_id
  end
end
