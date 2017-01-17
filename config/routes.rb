Rails.application.routes.draw do
  root "pages#show", page: 'home'
  get '/pages/:page', to: 'pages#show'

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/observations/new', to: 'observations#new_new'
  post '/observations', to: 'observations#create_new'

  resources :patients, shallow: true do
    resources :observations
  end


  resources :sessions, only: [:new, :create, :destroy]
  post '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end

