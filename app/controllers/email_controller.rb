class EmailController < ApplicationController
  def email_recipe
    response = EmailFacade.new.email_recipe(params[:recipient_email], params[:recipe_id], session[:user_id])
    if response[:status] == 200
      redirect_to "/dashboard"
      flash[:success] = "Successfully sent recipe to #{params[:recipient_email]}"
    else
      flash[:error] = "Unable to send email to #{params[:recipient_email]}"
    end
  end
end