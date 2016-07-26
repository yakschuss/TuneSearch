class Artist < ActiveRecord::Base
  has_many :songs

  scope :by_name, -> (param) { where("artist_name LIKE ?", "%#{param}%")}
end
