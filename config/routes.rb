Rails.application.routes.draw do
  resources :folders
  mount FileUploader::UploadEndpoint => '/files/upload'
  resources :uploads
  devise_for :users
  root 'home#index'
end
