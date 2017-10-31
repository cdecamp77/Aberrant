Rails.application.routes.draw do
root 'pages#show', page: 'welcome'
get '/pages/:page', to: 'pages#show'

resources :trades do
  resources :offers, except: [:index, :show, :new], shallow: true
end

resources :users, only: [:new, :create]
get '/profile', to: 'users#show'
get '/profile/edit', to: 'users#edit'
patch '/profile', to: 'users#update'
get '/login', to: 'sessions#new'

resources :sessions, only: [:new, :create, :destroy]


end
