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
    recipe_data = RecipesService.new.find(params[:recipe_id])
    @recipe = Recipe.new(recipe_data[:data][:attributes])
  end

  def create
    recipe_data = params.permit(:recipe_id, :title, :image, :summary, :instructions, :ingredients)
    recipe_data[:user_id] = session[:user_id] 
    response = RecipeFacade.new.store_recipe(recipe_data)
    if response[:status] == 204
      flash[:notice] = "Recipe added to your dashboard"
      redirect_to "/dashboard"
    else 
      flash[:error] = response[:error]
      redirect_to "/dashboard"
    end
  end 
end