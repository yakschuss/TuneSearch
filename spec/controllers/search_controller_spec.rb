require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET search" do

    let(:artist1) {create(:artist)}
    let(:artist2) {create(:artist)}
    let(:album1) {create(:album)}
    let(:album2) {create(:album)}
    let(:song1) {create(:song, album: album1, artist: artist1)}
    let(:song2) {create(:song, album: album1, artist: artist1)}
    let(:song3) {create(:song, album: album2, artist: artist2)}
    let(:song4) {create(:song, album: album2, artist: artist2)}
    let(:song5) {create(:song, album: album1, artist: artist2)}
    let(:song6) {create(:song, album: album2, artist: artist1)}

    context "when params are missing" do
      it "returns the desired values when just song title is present" do 
        post :search, format: :js, search_bar: {song_title: song3.song_title[0..3], artist_name: "", album_title: ""}
        expect(assigns(:songs)).to eq([song3])
      end

      it "returns the correct values when just album is present" do
        post :search, format: :js, search_bar: {song_title: "", artist_name: "" , album_title: album1[0..3]}
        expect(assigns(:songs)).to eq([song1, song2])
      end

      it "returns the correct values when just artist is present" do
        post :search, format: :js, search_bar: {song_title: "", artist_name: artist2[0..3], album_title: ""}
        expect(assigns(:songs)).to eq([song3, song4])
      end
    end

    context "when there are two params present" do
      it "returns all possible values for album" do
        post :search, format: :js, search_bar: {song_title: "", artist_name: "", album_title: album2[0..3]}
        expect(assigns(:songs)).to eq([song3, song4, song6])
      end

      it "returns all possible values for artist" do
        post :search, format: :js, search_bar: {song_title: "", artist_name: artist2[0..3], album_title: ""}
        expect(assigns(:songs)).to eq([song3, song4, song5])
      end

    end


  end
end
