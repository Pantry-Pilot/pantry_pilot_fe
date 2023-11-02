class SessionsController < ApplicationController
  def login_form

  end

  def login
    response = SessionsFacade.user_login(params[:email], params[:password])
    
    if response[:status] == 201
      session[:user_id] = params[:id]
      redirect_to "/"
    else
      flash[:error] = "Invalid credentials"
      redirect_to "/login"
    end
  end
end