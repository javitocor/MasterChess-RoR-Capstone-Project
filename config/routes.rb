Rails.application.routes.draw do
  
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

  resources :users
  resources :gambits do
    resources :comments
    resources :likes
  end
  
end
