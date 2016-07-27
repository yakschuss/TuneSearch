

FactoryGirl.define do 
  factory :song do
    song_title Faker::App.name
    artist 
    album
  end
end
