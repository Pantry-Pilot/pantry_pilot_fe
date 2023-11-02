class UsersController < ApplicationController
  def registration_form

  end

  def register
    if params[:password] == params[:confirm_password]
      response = UsersFacade.register_user(params[:name], params[:email], params[:password])
      if response[:status] == 201
        redirect_to "/login"
      else
        flash[:error] = "Missing Required Information"
        redirect_to "/register"
      end
    else
      flash[:error] = "Passwords do not match"
        redirect_to "/register"
    end
  end

  def show
    @user = UsersFacade.new.get_user(current_user)
  end
end