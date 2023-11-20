class RecipesController < ApplicationController
  def index
    @user = UsersFacade.new.get_user(current_user)
    begin
      @recipes = RecipeFacade.search(recipe_params) if !recipe_params.empty?
    rescue StandardError => e
      flash.now[:error] = "No recipes found"
    end
  end

  def show
    @user = UsersFacade.new.get_user(current_user)
    recipe_data = RecipesService.new.find(params[:recipe_id])
    @recipe = Recipe.new(recipe_data[:data][:attributes])
  end

  def create
    @user = UsersFacade.new.get_user(current_user)
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

  def destroy
    response = RecipeFacade.new.remove_recipe(params[:id])
    if response[:status] == 204
      flash[:notice] = "Recipe successfully removed"
      redirect_to "/dashboard"
    else
      flash[:error] = response[:error]
      redirect_to "/dashboard"
    end
  end

  private

  def recipe_params
    requirements = {}

    if params[:query].present?
      requirements[:query] = params[:query]
    end

    if params[:diet].present?
      requirements[:diets] = selected_diets(params[:diet])
    end
    
    if params[:intolerances].present?
      requirements[:intolerances] = selected_intolerances(params[:intolerances])
    end

    if params[:include_ingredient].present?
      requirements[:include] = params[:include_ingredient]
    end

    if params[:exclude_ingredient].present?
      requirements[:exclude] = params[:exclude_ingredient]
    end

    requirements
  end

  def selected_diets(diets)
    diets.keys
  end

  def selected_intolerances(intolerances)
    intolerances.keys
  end
end
