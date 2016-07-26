require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  let(:matching_artist) {Artist.create!(artist_name: "the_artist")}
  let(:non_matching_artist) {Artist.create!(artist_name: "not_artist")}
  let(:matching_album) {Album.create!(album_title: "the_album")}
  let(:non_matching_album) {Album.create!(album_title: "not_album")}
  let(:matching_song) {Song.create!(song_title: "song_one", artist: matching_artist, album: matching_album )}
  let(:matching_song_two) {Song.create!(song_title: "one_song", artist: matching_artist, album: matching_album)}
  let(:non_matching_song) {Song.create!(song_title: "different_song", artist: non_matching_artist, album: non_matching_album)}

  describe "GET search" do
    it "returns the correct values when artists and albums aren't present" do
      post :search, format: :js, search_bar: {song_title: "one", artist_name: "", album_title: ""}
      expect(assigns(:songs)).to eq([matching_song, matching_song_two])
    end

    it "returns the correct values when songs and albums aren't present" do
      post :search, format: :js, search_bar: {song_title: "", artist_name: "the", album_title: ""}
      expect(assigns(:songs)).to eq([matching_song, matching_song_two])
    end

    it "returns the correct values when songs and artists aren't present" do
      post :search, format: :js, search_bar: {song_title: "", artist_name: "", album_title: "the"}
      expect(assigns(:songs)).to eq([matching_song, matching_song_two])
    end


  end
end
