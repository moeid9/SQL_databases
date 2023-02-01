#Repository Class
require_relative 'bookstore'
class BookStoreRepository
	
	def all
		#prints all records
		sql = 'SELECT * FROM books'
		result_set = DatabaseConnection.exec_params(sql,[])
		books = []

		result_set.each do |record|
      book = BookStore.new
      book.id = record['id']
      book.title = record['title']
      book.author = record['author_name']
      
      books << book
    end
		return books
		
	end
	def format_output(books)
		i=0
		#prints all records formatted
		##got this error and am stuck with what to do
			# undefined method `format_output' for #<BookStore:0x00007f8c008d9a58 @id="1", @title="Nineteen Eighty-Four", @author="George Orwell"> (NoMethodError)
			books.each do
				p "#{books[i].id} - #{books[i].title} - #{books[i].author}"
				i+=1
			end
	end
end


## test examples
# repo = BookStoreRepository.new
# books = repo.all
# books.length = 5
# books.first.id = '1'
# books.first.name = 'Nineteen Eighty-Four'
# books[1].format = '1 - Nineteen Eighty-Four - George Orwell'
##