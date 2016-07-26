require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET search" do
    it "returns the correct values when artists and albums aren't present" do

      Song.create!(title: "onesong")
      Song.create!(title: "song-one")
      Song.create!(title: "song-three")

      get :search, search_bar: {song_name: "one", artist_name: nil, album_name: nil}

      expect(response).to match_array(%w(onesong song-one))

    end

    it "returns the correct values when songs and albums aren't present" do
      get :search, search_bar: {song_name: nil, artist_name: "something here", album_name: nil}
    end

    it "returns the correct values when songs and artists aren't present" do
      get :search, search_bar: {song_name: nil, artist_name: nil, album_name: "something here"}
    end




  end
end
