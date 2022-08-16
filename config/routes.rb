Rails.application.routes.draw do

  root to: "static_pages#index"

  get 'about', to: 'static_pages#about'
  get 'elsewhere', to: 'static_pages#contact'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :contacts
  resources :users, only: [:new, :create, :show, :edit, :update]
end
