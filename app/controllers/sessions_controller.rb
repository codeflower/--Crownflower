class SessionsController < ApplicationController
  include Autologin

  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      auto_login(user)
      redirect_to qr_codes_path, notice: "Добро пожаловать!"
    else
      redirect_to login_path, notice: "Неправильный email или пароль"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Вы успешно завершили сеанс"

  end

end
