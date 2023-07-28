Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get '/users', to: 'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'
  
  get '/users/:user_id/posts/', to: 'posts#index', as: 'user_posts'
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  post '/users/:user_id/posts/', to: 'posts#create', as: 'create_post'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'new_comment'
  post '/users/:user_id/posts/:id/comments', to: 'comments#create', as: 'create_comment'

  get '/likes/:id/create', to: 'likes#create', as: 'increment_likes'
end