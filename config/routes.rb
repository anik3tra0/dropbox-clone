Rails.application.routes.draw do
  resources :folders
  get 'browse/:folder_id' => 'home#browse', :as => 'browse'
  get 'browse/:folder_id/new_folder' => 'folders#new', :as => 'new_sub_folder'
  get 'browse/:folder_id/new_file' => 'uploads#new', :as => 'new_sub_file'
  get 'browse/:folder_id/rename' => 'folders#edit', :as => 'rename_folder'
  mount FileUploader::UploadEndpoint => '/files/upload'
  resources :uploads
  devise_for :users
  root 'home#index'
end
