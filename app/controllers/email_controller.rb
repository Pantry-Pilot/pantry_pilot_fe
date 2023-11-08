class EmailController < ApplicationController
  def email_recipe
    response = EmailFacade.new.email_recipe(params[:recipient_email], params[:recipe_id], session[:user_id])
    if response[:status] == 200
      redirect_to "/dashboard"
      flash[:success] = "Successfully sent recipe to #{params[:recipient_email]}"
    elsif response[:status] == 400
      flash[:error] = "Please save this recipe to your dashboard before emailing it!"
      redirect_to "/dashboard/search/#{params[:recipe_id]}"
      
    end
  end
end