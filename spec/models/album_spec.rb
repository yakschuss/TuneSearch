require 'rails_helper'

RSpec.describe Album, type: :model do
  let(:album1) {create(:album)}
  let(:album2) {create(:album)}

  describe "by_title" do
    it "returns the correct album" do
      album_list = Album.by_title(album1[0..3])
      expect(album_list).to eq([album1])
    end
  end

end
