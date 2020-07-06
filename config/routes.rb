Rails.application.routes.draw do
  devise_for :users
  root to: "matches#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :matches, only: [:show] do
    resources :user_choices, only: [:index, :create]
  end
end
