Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :users
  resources :comments
  resources :tasks
  resource :session, only: %i[new create destroy]
  resources :projects do
    post :add_user, on: :member
  end
end
