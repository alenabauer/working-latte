Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :cafes, only: [:index, :show, :new, :create ] do
    # member do
    # end
  end

  get '/chairs/:id/fetch_time_slots', to: 'chairs#fetch_time_slots'

  resources :chairs do
    resources :reservations, only: :create
  end

  get '/dashboard', to: 'dashboard#show_user'
  get '/bookmarks', to: 'bookmarks#index'
  get '/cafes/:id/favorites', to: 'cafes#favorite_cafe', as: :favorite_cafe
  get '/cafes/:id/unfavorite', to: 'cafes#unfavorite_cafe', as: :unfavorite_cafe
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
