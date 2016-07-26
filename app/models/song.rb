class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist

  scope :by_title, -> (param) {where("song_title LIKE ?", "%#{param}%")}
  scope :by_song_album, -> (param) {includes(:album).references(:album).merge(Album.by_title(param))}
  scope :by_song_artist, -> (param) {includes(:artist).references(:artist).merge(Artist.by_name(param))}

end
