require 'bookstore_repository'

describe BookStoreRepository do
	def reset_book_table
		seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'bookstore_test' })
    connection.exec(seed_sql)
	end

	before(:each) do
		reset_book_table
	end

	it "returns full data base with author" do
		repo = BookStoreRepository.new
		books = repo.all
		expect(books.length).to eq 5
		expect(books.first.id).to eq '1'
		expect(books.first.title).to eq 'Nineteen Eighty-Four'
		expect(books[0].format_output).to eq '1 - Nineteen Eighty-Four - George Orwell'
	end
end