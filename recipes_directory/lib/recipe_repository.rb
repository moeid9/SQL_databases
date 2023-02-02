require_relative './recipe'
class RecipeRepository

    # Selecting all records
    # No arguments
    def all
        sql = 'SELECT id, name, cooking_time, rating FROM recipe'
        result_set = DatabaseConnection.exec_params(sql,[])
        recipes = []
    
        result_set.each do |record|
            recipe = Recipe.new
            recipe.id = record['id']
            recipe.name = record['name']
            recipe.cooking_time = record['cooking_time']
            recipe.rating = record['rating']
            
            recipes << recipe
          end
          return recipes
    end
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
      # SELECT id, name, cohort_name FROM students WHERE id = $1;
        sql = 'SELECT name, cooking_time, rating FROM recipe WHERE id = $1;'
        params = [id]

        result = DatabaseConnection.exec_params(sql, params)
        result.each do |record|
            recipe = Recipe.new
            recipe.name = record['name']
            recipe.cooking_time = record['cooking_time']
            recipe.rating = record['rating']
            
            return recipe
          end
          
      # Returns a single Student object.
    end
  
    # Add more methods below for each operation you'd like to implement.
  
    # def create(student)
    # end
  
    # def update(student)
    # end
  
    # def delete(student)
    # end
  end