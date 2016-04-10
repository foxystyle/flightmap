Rails.application.routes.draw do

  root 'home#index'

  resources :airports
  resources :tickets
  resources :currencies
  resources :dates

end
