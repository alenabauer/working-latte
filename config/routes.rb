Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cafes, only: [:index, :show, :new, :create ]

  get '/dashboard', to: 'dashboard#show_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
