# frozen_string_literal: true

class QrCodesController < ApplicationController
  before_action :fetch_qr_code, only: %i[edit update destroy]
  # before_action :authorize, only: %i[index create]
  before_action :unauthorize, :admin, only: %i[index create]

  def new; end

  def show
    @qr_code = QrCode.find(params[:id])
    @qr_code.scans += 1
    @qr_code.save
    redirect_to @qr_code.url
  end

  def index
    if current_user&.admin?
      @title = 'Все'
      @qr_codes = QrCode.all.page(params[:page])
    elsif current_user
      @title = 'Мои'
      @qr_codes = current_user.qr_codes.page(params[:page])
      #  @qr_codes = QrCode.all.where({user_id: current_user.id}).page(params[:page])
    else
      @title = ''
      @qr_codes = QrCode.all.where({ user_id: @admin.id }).page(params[:page])
      # @qr_code.page(params[:page])
    end
  end

  def create
    @qr_color = params[:btncolor]
    @qr_bg_color = params[:btncolorbg]
    @scan_allow = params[:remember]

    qr_code = QrCode.new
    qr_code.name = params[:name]
    qr_code.url = params[:url]
    qr_code.qr_color = @qr_color
    qr_code.qr_bg_color = @qr_bg_color
    qr_code.user_id = if current_user
                        current_user.id
                      else
                        @admin.id
                      end

    if qr_code.save
      redirect_to qr_codes_path, { notice: 'Qr Code was successfully created' }
    else
      redirect_to root_path, { alert: 'Qr Code не был создан. Попробуйте ещё раз' }
    end
  end

  def edit; end

  def update
    if @qr_code.save
      redirect_to qr_codes_path, { notice: 'Qr Code was successfully update' }
    else
      redirect_to edit_qr_code_path, { alert: 'Qr Code was NOT updated' }
    end
  end

  def destroy
    @qr_code.destroy
    redirect_to qr_codes_path   # , { notice: 'Qr Code was successfully delete'}
  end

  private

  def fetch_qr_code
    @qr_code = QrCode.find_by(id: params[:id])
  end

  def admin
    @admin = User.all.first
  end
end
