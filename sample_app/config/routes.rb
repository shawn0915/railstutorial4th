Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  Rails.application.routes.draw do

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

    # Users
    resources :users

  end

end