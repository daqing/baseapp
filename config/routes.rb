Rails.application.routes.draw do
  root "home#index"

  resources :users do
  end

  resources :sessions do
  end

  get "sign_in" => "sessions#new"
  delete "sign_out" => "sessions#destroy"
end
