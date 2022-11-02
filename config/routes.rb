Rails.application.routes.draw do
  root 'sessions#new'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
  resources :photos, only: [:new, :index, :create]
  resources :oauth, only: :create do
    collection do
      get "callback"
    end
  end
  resources :tweets, only: :create
end
