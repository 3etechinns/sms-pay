Rails.application.routes.draw do
  root "home#index"

  get "/login" => "sessions#new"
  post "/new_session" => "sessions#create", as: :new_session
  get "/logout" => "sessions#destroy", as: :logout

  resources :organizations do
    resources :charges
  end
  get '/endpoint' => 'users#endpoint'
end
