Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :cafes, only: [:index, :show, :new, :create ]

  resources :chairs do
    resources :reservations, only: :create
  end

  get '/dashboard', to: 'dashboard#show_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
