Rails.application.routes.draw do
  
  get 'static_pages/learn'
  get 'static_pages/tactics'
  get 'static_pages/historical'
  get 'followings/create'
  get 'followings/destroy'
  root 'gambits#index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
    confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/signup', to: 'registrations#new'
    post '/login', to: 'devise/sessions#create'
    authenticated :user do
      root 'gambits#index'
    end  
    unauthenticated do
      root 'devise/sessions#new'
    end
  end

  resources :users, only: [:index, :show] do
    resources :followings, only: [:create, :destroy] 
  end
  resources :gambits do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  get '/search', to: 'searches#search'
  
end
