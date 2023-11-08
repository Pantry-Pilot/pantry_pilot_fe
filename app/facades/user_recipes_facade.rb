class UserRecipesFacade
  
  def get_user_recipes(user_id)
    response = UserRecipesService.new.get_user_recipes(user_id)
    recipes_array = response[:recipes][:data].map do |recipe_data|
      UserRecipe.new(recipe_data)
    end
    avatars_array = response[:avatar_urls]
    recipes_array.each_with_index do |recipe, index|
      recipe.avatar = avatars_array[index] if avatars_array[index] != nil
    end
    recipes_array
  end
end