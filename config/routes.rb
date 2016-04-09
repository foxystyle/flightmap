Rails.application.routes.draw do

  root 'home#index'

  resources :airports
  resources :tickets

end
