require 'music_library_repository'
describe AlbumRepository do

  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  

  before(:each) do 
    reset_albums_table 
  end
    # (your tests will go here).
		
	it 'returns the list of Albums' do
		repo = AlbumRepository.new
		albums = repo.all
		expect(albums.length).to eq (3)
		expect(albums.first.title).to eq ('Her Loss')
		expect(albums.first.artist_id).to eq ('1')
    expect(albums.first.release_year).to eq ('2022')
	end

  it "returns the information of a given entry with the find method" do
    repo = AlbumRepository.new
    selection_1 = repo.find(1)
    expect(selection_1.artist_id).to eq "1"
    expect(selection_1.title).to eq "Her Loss"
    expect(selection_1.release_year).to eq "2022"
  end
  it "creates a new album and then returns its title" do
    repo = AlbumRepository.new
    new_album = Album.new 
    new_album.title = "Views"
    new_album.release_year = "2016"
    new_album.artist_id = "1"
    repo.create(new_album)
    selection = repo.find(4)
    expect(selection.title).to eq "Views"
    expect(selection.artist_id).to eq "1"
    expect(selection.release_year).to eq "2016"
  end
  it "changes the release year of album Her Loss from 2020 to 2025" do
    repo = AlbumRepository.new
    repo.update("Her Loss", "release_year", "2025")
    selection = repo.find(1)
    expect(selection.release_year).to eq "2025"
  end

#  it "deletes album Honestly, Never Mind" do
#     repo1 = AlbumRepository.new
#     repo1.delete("Honestly, Never Mind")
#     albums = repo1.all
#     expect(albums.length).to eq 2
#   end

end