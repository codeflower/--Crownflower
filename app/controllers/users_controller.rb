class UsersController < ApplicationController
  include Autologin
  
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  if current_user.admin?
    @users = User.all.page(params[:page])
  else  
    @users = current_user.users.page(params[:page])
    #  @qr_codes = QrCode.all.where({user_id: current_user.id}).page(params[:page])
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
