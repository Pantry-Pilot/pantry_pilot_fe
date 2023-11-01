class UsersController < ApplicationController
  def login_form

  end

  def login
    conn = Faraday.new(url: "http:localhost:3000")
    response = conn.post("/login") do |f|
      f.params["email"] = params[:email]
      f.params["password"] = params[:password]
    end
    parsed = JSON.parse(response.body, symbolize_names: true)

    if parsed
      session[:user_id] = params[:id]
      redirect_to "/dashboard"
    else
      flash[:error] = "Invalid credentials"
      redirect_to "/login"
    end
  end
end