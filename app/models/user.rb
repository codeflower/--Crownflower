# frozen_string_literal: true

class User < ApplicationRecord
  has_many :qr_codes
  has_secure_password
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: { message: 'Введи действительный адрес почты' }
  validates :password, length: { in: 8..20, message: 'Введи пароль, 8 - 127 символов' }
end
