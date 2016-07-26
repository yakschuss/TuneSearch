require 'faker'

songs = Song.all

(songs.count+1).upto(100) do
  Song.create!(first_name: Faker::App.name)
end

puts "Seed Done."
puts "#{Song.count} songs exist"
