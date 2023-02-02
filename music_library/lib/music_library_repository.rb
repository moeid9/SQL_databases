#Repository Class
require_relative './music_library'
class ArtistRepository
  def all
    sql = 'SELECT id, name, genre FROM artists'
    result_set = DatabaseConnection.exec_params(sql,[])
    artists = []

    result_set.each do |record|
      artist = Artist.new
      artist.id = record['id']
      artist.name = record['name']
      artist.genre = record['genre']
      
      artists << artist
    end
    return artists
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists WHERE id = $1;
    sql = 'SELECT name, genre FROM artists WHERE id = $1;'
    params = [id]

    result = DatabaseConnection.exec_params(sql, params)
    result.each do |record|
      artist = Artist.new
      artist.name = record['name']
      artist.genre = record['genre']
      
      return artist
    end
    # Returns a single artist object.
  end

end