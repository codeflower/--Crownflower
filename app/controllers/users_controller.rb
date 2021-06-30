class UsersController < ApplicationController
  before_action :fetch_user, only: [:edit, :update, :destroy]
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

  def edit
  end

  def update

    if @user.update(user_params)
      redirect_to users_path, { notice: 'User was successfully update'}
    else
      redirect_to edit_user_path, { alert: 'User was NOT updated'}
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path   # , { notice: 'Qr Code was successfully delete'}
  end

  private
  
  def fetch_user
    @user = User.find_by(id: params[:id])
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
