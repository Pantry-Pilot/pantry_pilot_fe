class RecipesController < ApplicationController
  def index
    if params[:query].present?
      begin
        @recipes = RecipeFacade.search(params[:query])
      rescue StandardError => e
        flash.now[:error] = "No recipes found"
      end
    end
  end

  def show
    recipe_data = RecipesService.new.find(params[:id])
    @recipe = Recipe.new(recipe_data[:data][:attributes])
  end
end