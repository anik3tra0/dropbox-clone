Rails.application.routes.draw do
  resources :uploads
  devise_for :users
  root 'home#index'
end
