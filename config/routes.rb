Rails.application.routes.draw do
root 'users#index'
resources :trades

resources :users, only: [:new, :create, :main]
resources :sessions, only: [:new, :create, :destroy]

get '/login', to: 'sessions#new'
get '/profile', to: 'users#profile'
get '/trade', to: 'trades#new'


end
