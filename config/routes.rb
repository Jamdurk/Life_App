Rails.application.routes.draw do
  
  root "daily_entries#home"


  resources :daily_entries, only: [ :edit, :update, :show,  :create, :destroy, :index ]
  resources :goals, only: [ :new, :edit, :update, :show, :create, :destroy, :index ]  
  resources :hobbies, only: [ :new, :edit, :update, :show, :create, :destroy, :index ]

  get "up" => "rails/health#show", as: :rails_health_check
end

