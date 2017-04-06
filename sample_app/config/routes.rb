# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# root 'application#hello'
Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  # get 'static_pages/home'
  # get 'static_pages/help'
  # 具名路由  help_path -> '/help'
  get '/help', to: 'static_pages#help', as: 'helf'
  # get 'static_pages/about'
  get '/about', to: 'static_pages#about'
  # get 'static_pages/contact'
  get '/contact', to: 'static_pages#contact'

  # 注冊
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # Session
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destory'

  # Users
  resources :users
  # GET /account_activation/<token>/edit
  # edit edit_account_activation_url(token)
  resources :account_activations, only: [:edit]
=begin
GET /password_resets/new new new_password_reset_path
POST /password_resets create password_resets_path
GET /password_resets/<token>/edit edit edit_password_reset_path(token)
PATCH /password_resets/<token> update password_reset_path(token)
=end
  resources :password_resets, only: [:new, :create, :edit, :update]
=begin
POST /microposts create microposts_path
DELETE /microposts/1 destroy micropost_path(micropost)
=end
  resources :microposts, only: [:create, :destroy]


end