Rails.application.routes.draw do
  resource :session, only: [:create, :destroy]
  resources :users, only: [:create]

  resources :yos, only: [:create]

  resource :pusher_authentication, only: [:create]

  get "/sign_in" => "sessions#new", as: :sign_in
  get "/sign_up" => "users#new", as: :sign_up

  root "yos#index"
end
