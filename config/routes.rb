Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]
  resources :users, only: [:create]
  resource :home, only: [:show]

  resources :yos, only: [:index, :create]

  resource :pusher_authentication, only: [:create]

  get "/sign_in" => "sessions#new", as: :sign_in
  get "/sign_up" => "users#new", as: :sign_up

  root "homes#show"
end
