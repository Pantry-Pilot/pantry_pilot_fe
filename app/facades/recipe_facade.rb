class RecipeFacade
  def self.search(query)
    response = RecipesService.new.search(query)
    raw_recipes = response[:data]
    raw_recipes.map do |recipe_data|
      create_recipe(recipe_data[:attributes])
    end
  end

  def self.find(id)
    raw_recipe = RecipesService.new.find(id)
    if raw_recipe[:data].present?
      Recipe.new(raw_recipe[:data][:attributes])
    else
      nil
    end
  end

  def store_recipe(data)
    response = RecipesService.new.store_recipe(data)

    if response.status == 204
      {
        status: response.status,
      }
    else
      {
        status: response.status,
        error: response_body[:error]
      }
    end
  end

  private

  def self.create_recipe(data)
    Recipe.new(data)
  end
end
