Rails.application.routes.draw do
  resources :vote_posts
  resources :following_channels
  get 'homepage/index'
  root 'homepage#index'
  resources :comments
  resources :posts
  resources :channels
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
