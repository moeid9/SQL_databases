# file: app.rb
require_relative 'lib/music_library_repository'
require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library_test')

# Perform a SQL query on the database and get the result set.


# Print out each record from the result set .
artist_repository = ArtistRepository.new

artist_repository.all.each do |artist|
  p artist
end