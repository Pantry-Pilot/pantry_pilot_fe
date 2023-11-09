class AvatarsController < ApplicationController
  def create
    avatar_data = params.permit(:id, :avatar)
    response = AvatarsFacade.new.add_image_to_recipe(avatar_data)
    if response[:status] == 200
      flash[:notice] = response[:notice]
      redirect_to "/dashboard"
    else
      flash[:error] = response[:error]
      redirect_to "/dashboard"
    end
  end

  def destroy
    recipe_id = params[:id]
    response = AvatarsFacade.new.remove_avatar_from_recipe(recipe_id)
    if response[:status] == 200
      flash[:notice] = response[:notice]
      redirect_to "/dashboard"
    else
      flash[:error] = response[:error]
      redirect_to "/dashboard"
    end
  end
end