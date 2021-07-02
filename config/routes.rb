# frozen_string_literal: true

Rails.application.routes.draw do
  default_url_options host: 'finalnyi-proiekt-crownflower.rubycourse0121.repl.co/'

  resources :qr_codes
  resources :users

  get '/contacts', to: 'pages#contacts', as: :contacts
  get '/about', to: 'pages#about'

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  root 'qr_codes#new'

  # get '/qr_codes', to: 'qr_codes#index', as: :qr_codes
  # post '/qr_codes', to: 'qr_codes#create', as: :qr_codes_create
  # get '/qr_codes/:id', to: 'qr_codes#show'
  # get '/qr_codes/:id/edit', to: 'qr_codes#edit', as: :edit_qr_code
  # patch '/qr_codes/:id', to: 'qr_codes#update', as: :qr_code
  # delete '/qr_codes/:id', to: 'qr_codes#destroy'

  # get '/users/new', to: 'users#new', as: :new_user
  # post '/users', to: 'users#create', as: :users

  # File: config/routes.rb

  # get '404', to: 'application#page_not_found'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
