Rails.application.routes.draw do
  resources :posts
  mount FileUploader::UploadEndpoint => '/files/upload'
  resources :uploads
  devise_for :users
  root 'home#index'
end
