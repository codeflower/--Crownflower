# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :fetch_user, only: %i[edit update destroy]
  include Autologin

  def new
    @user = User.new
  end

  def index
    # @users = User.all
    @title = 'Все'
    @users = User.all.page(params[:page])
    # @qr_codes = QrCode.all.where({user_id: current_user.id}).page(params[:page])
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to qr_codes_path, notice: 'Пользователь успешно создан'
    else
      # redirect_to new_user_path
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path, { notice: 'Пользователь успешно обновлен' }
    else
      redirect_to edit_user_path, { alert: 'Пользователь не был обновлен' }
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path   # , { notice: 'Qr Code was successfully delete'}
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def fetch_user
    @user = User.find_by(id: params[:id])
  end
end
