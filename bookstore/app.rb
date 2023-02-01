# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/bookstore_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('bookstore_test')

# Perform a SQL query on the database and get the result set.

result = BookStoreRepository.new
repo = result.all
# Print out each record from the result set 
result.format_output(repo)