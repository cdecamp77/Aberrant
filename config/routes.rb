Rails.application.routes.draw do
root 'pages#show', page: 'welcome'
get '/pages/:page', to: 'pages#show'

resources :trades
get '/trades/:id', to: 'trades#show'
get '/trade/edit', to: 'trades#edit'
patch '/trades', to: 'trades#update'

resources :users, only: [:new, :create]
get '/profile', to: 'users#show'
get '/profile/edit', to: 'users#edit'
patch '/profile', to: 'users#update'

resources :sessions, only: [:new, :create, :destroy]

get '/login', to: 'sessions#new'

end
