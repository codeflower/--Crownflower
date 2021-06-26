class PagesController < ApplicationController
  
  def contacts
    @contacts = [
      {
        avatar: 'andrey.jpg',
        name_label: 'Имя: ',
        name: 'Andrey',
        email_label: 'email: ',
        email: 'andrey@gmail.com',
        tel_label: 'tel: ',
        tel: '+375777777777',
        tel_link: 'tel:375777777777'
      },
      {
        avatar: 'vadim.jpg',
        name_label: 'Имя: ',
        name: 'Vadim',
        email_label: 'email: ',
        email: 'vadim@gmail.com',
        tel_label: 'tel: ',
        tel: '+375777777777',
        tel_link: 'tel:375777777777'
      },{
        avatar: 'dina.jpg',
        name_label: 'Имя: ',
        name: 'Dina',
        email_label: 'email: ',
        email: 'dina@gmail.com',
        tel_label: 'tel: ',
        tel: '+375777777777',
        tel_link: 'tel:375777777777'
      },{
        avatar: 'lina.jpg',
        name_label: 'Имя: ',
        name: 'Lina',
        email_label: 'email: ',
        email: 'lina@gmail.com',
        tel_label: 'tel: ',
        tel: '+375777777777',
        tel_link: 'tel:375777777777'
      }
    ]
  end

  def about
  end
  
end