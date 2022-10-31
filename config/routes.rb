Rails.application.routes.draw do
  root 'sessions#new'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  resources :photos, only: [:index]
end
