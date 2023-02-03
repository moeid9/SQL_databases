require_relative '../app.rb'

RSpec.describe Application do
	before(:each) do 
		@database = 'music_library_test'
		@io = double :io
		@album_repository = double :album_repository
		@artist_repository = double :artist_repository
	
	
		album_1 = double(:album, :id => '1', :title => "Her Loss")
		album_2 = double(:album, :id => '3', :title => "Love Yourself Her")
	
		allow(@album_repository).to receive(:all).and_return([album_1, album_2])
	
		artist_1 = double(:artist, :id => '1', :name => 'Drake')
		artist_2 = double(:artist, :id => '2', :name => 'BTS')
	
	
		allow(@artist_repository).to receive(:all).and_return([artist_1, artist_2])
	
	  end
	  after(:each) do 
		app = Application.new(@database, @io, @album_repository, @artist_repository)
		app.run
	  end
	  it 'asks the user for input and returns option 1' do
		
		expect(@io).to receive(:puts).with('Welcome to the music library manager!').ordered
		expect(@io).to receive(:puts).with('What would you like to do?').ordered
		expect(@io).to receive(:puts).with(' 1 - List all albums').ordered
		expect(@io).to receive(:puts).with(' 2 - List all artists').ordered
		expect(@io).to receive(:puts).with('Enter your choice: ').ordered
		expect(@io).to receive(:gets).and_return("1")
		expect(@io).to receive(:puts).with("Here is the list of albums:")
    	expect(@io).to receive(:puts).with("1 - Her Loss")
    	expect(@io).to receive(:puts).with("3 - Love Yourself Her")
	end
  	it 'asks the user for input and returns option 2' do
		
		expect(@io).to receive(:puts).with('Welcome to the music library manager!').ordered
		expect(@io).to receive(:puts).with('What would you like to do?').ordered
		expect(@io).to receive(:puts).with(' 1 - List all albums').ordered
		expect(@io).to receive(:puts).with(' 2 - List all artists').ordered
		expect(@io).to receive(:puts).with('Enter your choice: ').ordered
		expect(@io).to receive(:gets).and_return("2")
		expect(@io).to receive(:puts).with("Here is the list of artists:")
    	expect(@io).to receive(:puts).with("1 - Drake")
    	expect(@io).to receive(:puts).with("2 - BTS")
	end
end