require 'rails_helper'

RSpec.describe Song, type: :model do

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


  describe "by title" do
    it "returns a list of songs that shares the input sequence" do
      song_list = Song.by_title(song1[0..3])
      expect(song_list).to eq([ song1 ])
    end
  end

  describe "by_song_album" do
    it "returns a list of songs by the song's album relationship" do
      song_list = Song.by_song_album(album1[0..3])
      expect(song_list).to eq([song1, song2, song5])
    end
  end

  describe "by_song_artist" do
    it "returns a list of songs by the song's artist relationship" do
      song_list = Song.by_song_artist(artist2[0..3])
      expect(song_list).to eq([song3, song4, song5])
    end
  end

end
