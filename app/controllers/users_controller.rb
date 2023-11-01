class UsersController < ApplicationController
  def new
    @user = "place call to backend API here, or we can store users on the frontend"
  end

  def create
    @user = "place call to backend API here, or we can store users on the frontend"

    # if @user.save
    #   flash[:success] = "You have successfully created an account. Please log in."
    #   redirect_to login_path
    # else
    #   flass[:error] = "Something went wrong. Please try again."
    #   redirect_to new_user_path
    # end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
