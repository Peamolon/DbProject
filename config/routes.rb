Rails.application.routes.draw do
  get 'employees/dependency', to: 'employees#by_dependency'
  get 'employees/held_position', to: 'employees#by_held_position'
  get 'home/index'
  resources :employees
  devise_for :users
  root "home#index"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
