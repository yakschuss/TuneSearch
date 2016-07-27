require 'rails_helper'

RSpec.describe Artist, type: :model do
  let(:artist1) {create(:artist)}
  let(:artist2) {create(:artist)}

  describe "by_name" do
    it "returns the correct artist" do
      artist_list = Artist.by_name(artist1[0..3])
      expect(artist_list).to eq([artist1])
    end
  end
end
