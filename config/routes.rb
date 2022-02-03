# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  resources :users
  resources :comments
  resources :tasks
  resource :session, only: %i[new create destroy]
  resources :projects do
    post :add_user, on: :member
  end
  
  get '*path', :to => 'application#not_found'
  
end
