Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :managements, only: [:index]

  resources :leaves
  resources :daily, :controller => "daily_reports"

  root to: "managements#index"
end
