# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_menu_links
  before_action :authorize, only: %i[index create]

  def set_menu_links
    @menu_link = [{
      link_name: 'Главная',
      link_path: root_path,
      link_class: 'home-class'
    }, {
      link_name: 'Мои qr коды',
      link_path: qr_codes_path
    }, {
      link_name: 'Наши контакты',
      link_path: contacts_path
    }, {
      link_name: 'О нас',
      link_path: about_path
    }]

    @users_link = []
    if current_user
      @users_link.push({
                         link_name: 'Выход',
                         link_path: logout_path,
                         link_method: :delete
                       })
    else
      @users_link.push({
                         link_name: 'Регистрация',
                         link_path: new_user_path
                       })
      @users_link.push({
                         link_name: 'Войти',
                         link_path: login_path
                       })
    end
  end

  def page_not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  helper_method :current_user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorize
    return if current_user

    redirect_to new_user_path, { alert: 'Пользователь не зарегестрирован' }
  end
end
