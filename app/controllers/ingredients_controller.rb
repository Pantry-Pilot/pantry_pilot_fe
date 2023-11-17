class IngredientsController < ApplicationController
  def new

  end

  def create
  ingredient_data = ingredient_params
  ingredient_data[:user_id] = current_user
    response = IngredientsFacade.create_user_ingredient(ingredient_data)
    if response[:status] == 204
      flash[:notice] = "Ingredient added to your Pantry"
      redirect_to "/pantry"
    else 
      flash[:error] = "Ingredient not added"
      redirect_to "pantry/new"
    end
  end

  def index
    @ingredients = IngredientsFacade.get_user_ingredients(current_user)
  end

  private
  
  def ingredient_params
    params.permit(:name, :quantity, :exp_date)
  end
end