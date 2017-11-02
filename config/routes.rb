Rails.application.routes.draw do
root 'pages#show', page: 'welcome'
get '/pages/:page', to: 'pages#show'

delete 'trades/:id', to: 'trades#destroy'

resources :trades do
  resources :offers, except: [:index, :show, :new], shallow: true
end

patch '/offers/:id/accept', to: 'offers#accept', as: 'accept'

resources :users, only: [:new, :create]
get '/profile', to: 'users#show'
get '/profile/edit', to: 'users#edit'
patch '/profile', to: 'users#update'
get '/login', to: 'sessions#new'

resources :sessions, only: [:new, :create, :destroy]


end
