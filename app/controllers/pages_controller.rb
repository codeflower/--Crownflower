class PagesController < ApplicationController
  
  def contacts
    @contacts = [
      {
        email_ico: 'email-256.png',
        email_label: 'email: ',
        email: 'vadim@gmail.com',
        tel_ico: 'phone-256.png',
        tel_label: 'tel: ',
        tel: '+375333062942',
        tel_link: 'tel:+375333062942'
      }]
  end

  def about
  end
  
end