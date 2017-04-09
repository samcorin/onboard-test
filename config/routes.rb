Rails.application.routes.draw do
  root 'managers#index'

  resources :managers do
    resources :employees
  end
  resources :employees

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
