Rails.application.routes.draw do
  root to: "static_pages#index"

  get 'about', to: 'static_pages#about'
  get 'elsewhere', to: 'static_pages#contact'

  resources :contacts
  resources :users, only: [:new, :create]
end
