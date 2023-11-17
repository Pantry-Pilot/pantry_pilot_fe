class IngredientsFacade
  def self.create_user_ingredient(ingredient_data)
    response = IngredientsService.new.add_user_ingredient(ingredient_data)
    if response.status == 204
      {status: response.status}
    else
      {status: response.status}
    end
  end

  def self.get_user_ingredients(user)
    response = IngredientsService.new.get_user_ingredients(user)
    response_body = JSON.parse(response.body, symbolize_names: true)
    response_body[:ingredients][:data].map do |ingredient_data|
      UserIngredient.new(ingredient_data)
    end
  end

  def self.delete_ingredient(ingredient_id)
    response = IngredientsService.new.delete_ingredient(ingredient_id)
    if response.status == 204
      {status: response.status}
    else
      {status: response.status}
    end
  end

  def self.expiring_ingredients(user)
    response = IngredientsService.new.expiring_ingredients(user)
    response_body = JSON.parse(response.body, symbolize_names: true)
    response_body[:ingredients][:data].map do |ingredient_data|
      UserIngredient.new(ingredient_data)
    end
  end
end