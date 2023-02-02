require 'recipe_repository'
describe RecipeRepository do

  def reset_recipe_table
    seed_sql = File.read('spec/seeds_recipe.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_recipe_table 
  end

	it' gets all recipes' do
		repo = RecipeRepository.new
		recipes = repo.all
		expect(recipes.length).to eq (2) 
		expect(recipes[0].id).to eq ('1')
		expect(recipes[0].name ).to eq ('Ramen')
		expect(recipes[0].cooking_time).to eq ('5')
		expect(recipes[0].rating ).to eq ('8')
	end

	it 'finds a specific example'do
    repo = RecipeRepository.new
    selection = repo.find(1)
    expect(selection.name ).to eq ('Ramen')
    expect(selection.cooking_time).to eq ('5')
		expect(selection.rating ).to eq ('8')
  end
end