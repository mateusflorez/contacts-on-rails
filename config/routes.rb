Rails.application.routes.draw do
  resources :contacts
  root to: "static_pages#index"
  get 'about', to: 'static_pages#about'
  get 'elsewhere', to: 'static_pages#contact'
end
