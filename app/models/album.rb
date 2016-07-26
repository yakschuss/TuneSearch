class Album < ActiveRecord::Base
  has_many :songs

  scope :by_title, -> (param) { where("album_title LIKE ?", "%#{param}%")}
end
