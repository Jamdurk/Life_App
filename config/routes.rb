Rails.application.routes.draw do
  
  root "daily_entries#home"

  get "/goals", to: "goals#goals_page"
  get "/hobbies", to: "hobbies#hobbies_page"

  resources :daily_entries, only: [:edit, :update,  :create, :destroy]
  resources :goals, only: [:edit, :update,  :create, :destroy]
  resources :hobbies, only: [:edit, :update,  :create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end

