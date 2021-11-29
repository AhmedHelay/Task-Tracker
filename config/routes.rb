Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :tasks
  resources :projects do
    post :add_user, on: :member
  end
  resources :users
  root 'home#index'
end
