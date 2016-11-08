Rails.application.routes.draw do
  root to: "home#show"

  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users, only: [:new, :create] do
    resources :links, only: [:index, :create, :update, :edit] do
      put '/', to: 'links#change'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
