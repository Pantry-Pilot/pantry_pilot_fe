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
    # require 'pry';binding.pry
    recipe_data = RecipesService.new.find(params[:recipe_id])
    @recipe = Recipe.new(recipe_data[:data][:attributes])
  end
end