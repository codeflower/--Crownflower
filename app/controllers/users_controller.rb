class UsersController < ApplicationController
  include Autologin
  
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end


  def show
    
  end

  def create
  user = User.new(user_params)
    if user.save
      auto_login(user)
      redirect_to qr_codes_path, notice: "Пользователь успешно создан"
    else
      # redirect_to new_user_path
      render :new
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
