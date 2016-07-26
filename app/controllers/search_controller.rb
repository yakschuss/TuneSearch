class SearchController < ApplicationController
  def search
    song_title_param = params[:search_bar][:song_title]
    album_title_param = params[:search_bar][:album_title]
    artist_name_param = params[:search_bar][:artist_name]

    @songs = Song.by_title(song_title_param).by_song_album(album_title_param).by_song_artist(artist_name_param)
  end
end
