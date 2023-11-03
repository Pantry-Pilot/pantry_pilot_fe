class RecipesController < ApplicationController
  def index
    if params[:query].present?
      @recipes = RecipeFacade.search(params[:query])
    else
      @recipes = []
    end
  end

  def show
    recipe_data = RecipesService.new.find(params[:id])
    if recipe_data[:data] && recipe_data[:data][:attributes]
      @recipe = Recipe.new(recipe_data[:data][:attributes])
    else
    end
  end
end