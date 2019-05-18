class UsersController < ApplicationController
  # before_filter :authorize

  def new
  end

  def create
    user = User.new(user_params)

    if User.find_by(email: user.email)
      redirect_to('/signup') and return
    end

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
