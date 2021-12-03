Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users
  resources :comments
  resources :tasks
  resources :projects do
    post :add_user, on: :member
  end
  resources :users
  root 'home#index'
end
