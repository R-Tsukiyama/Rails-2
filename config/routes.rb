Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users
  root to: 'home#index'
  get 'home/index'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
