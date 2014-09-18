Rails.application.routes.draw do

get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'

resources :stations
resources :lines
resources :stops
resources :users , :except => [:index]
resources :sessions, :except => [:index]
end
