Rails.application.routes.draw do
root 'users#index'
resources :trades, only: [:new, :create, :destroy]

resources :users, only: [:new, :create, :main]
resources :sessions, only: [:new, :create, :destroy]

get '/login', to: 'sessions#new'
get '/profile', to: 'users#profile'
get '/trade', to: 'trades#new'
post '/trades/new', to: 'users#profile'


end
