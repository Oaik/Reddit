Rails.application.routes.draw do
  # Devise routes
  devise_for :users
  
  # Resources
  resources :vote_posts
  resources :following_channels
  resources :comments
  resources :posts
  resources :channels
  
  # homepage
  root 'homepage#index'
end
