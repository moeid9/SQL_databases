require_relative 'lib/recipe_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect('recipes_directory')

repo = RecipeRepository.new
p repo.find(2)