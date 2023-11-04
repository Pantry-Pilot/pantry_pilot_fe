class UserRecipesFacade
  def get_user_recipes(user_id)
    response = UserRecipesService.new.get_user_recipes(user_id)
    # require 'pry';binding.pry
    response[:data].map do |recipe_data|
      UserRecipe.new(recipe_data)
    end
  end
end