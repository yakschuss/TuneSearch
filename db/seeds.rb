require 'faker'

artists = Artist.all

(artists.count+1).upto(10) do
  Artist.create!(name: Faker::App.author)
end

albums = Album.all

(albums.count+1).upto(100) do
  Album.create!(
    title: Faker::Book.title,
    artist: artists.sample
  )
end

songs = Song.all

(songs.count+1).upto(500) do
  Song.create!(
    title: Faker::App.name,
    album: albums.sample
  )
end


puts "Seed Done."
puts "#{Artist.count} artists exist"
puts "#{Album.count} albums exist"
puts "#{Song.count} songs exist"
