Rails.application.routes.draw do
root 'users#index'
resources :trades

resources :users, only: [:new, :create, :main]
resources :sessions, only: [:new, :create, :destroy]

get '/login', to: 'sessions#new'
get '/main', to: 'users#main'
get '/trade', to: 'trades#new'


end
