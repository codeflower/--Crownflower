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
      }
      
      # {
      #   avatar: 'vadim.jpg',
      #   name_label: 'Имя: ',
      #   name: 'Vadim',
      #   email_label: 'email: ',
      #   email: 'vadim@gmail.com',
      #   tel_label: 'tel: ',
      #   tel: '+375777777777',
      #   tel_link: 'tel:375777777777'
      # },{
      #   avatar: 'dina.jpg',
      #   name_label: 'Имя: ',
      #   name: 'Dina',
      #   email_label: 'email: ',
      #   email: 'dina@gmail.com',
      #   tel_label: 'tel: ',
      #   tel: '+375777777777',
      #   tel_link: 'tel:375777777777'
      # },{
      #   avatar: 'lina.jpg',
      #   name_label: 'Имя: ',
      #   name: 'Lina',
      #   email_label: 'email: ',
      #   email: 'lina@gmail.com',
      #   tel_label: 'tel: ',
      #   tel: '+375777777777',
      #   tel_link: 'tel:375777777777'
      # }
    ]
  end

  def about
  end
  
end