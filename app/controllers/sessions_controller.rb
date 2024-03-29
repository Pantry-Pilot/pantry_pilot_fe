class SessionsController < ApplicationController
  before_action :capture_session, only: [:login]

  def login_form
    
  end

  def login
    response = SessionsFacade.user_login(params[:email], params[:password])
  if response[:status] == 201
      session[:user_id] = response[:user_id]
      redirect_to "/dashboard"
    else
      flash[:error] = response[:error]
      redirect_to "/login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end

  def create_oauth
    if request.env["omniauth.auth"]["info"]["email_verified"] == true
      response = UsersFacade.new.oauth_verification(request.env["omniauth.auth"]["info"]["email"])
      
      if response[:status] == 201
        session[:user_id] = response[:user_id]
        redirect_to "/dashboard"
      else
        flash[:error] = response[:error]
        redirect_to "/login"
      end
    else
      flash[:error] = response[:error]
      redirect_to "/login"
    end
  end


  private

  def capture_session
    current_user
  end
end
