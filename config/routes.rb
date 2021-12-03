Rails.application.routes.draw do
  get 'employees/dependency', to: 'employees#by_dependency'
  get 'employees/graphics', to: 'employees#graphics'
  get 'employees/eps', to: 'employees#by_eps'
  get 'employees/pension', to: 'employees#by_pension'
  get 'employees/pdf', to: 'employees#generate_pdf'
  get 'employees/held_position', to: 'employees#by_held_position'
  get 'eps_entity/frecuency', to: 'eps_entities#by_frecuency'
  get 'home/index'
  resources :novelties, only: [:index, :new, :create]
  get 'all_novelties', to: 'novelties#all_novelties'
  get 'all_novelties/by_dependency', to: 'novelties#novelties_by_dependency'
  get 'all_novelties/by_employee', to: 'novelties#novelties_by_employee'

  resources :employees
  devise_for :users
  root "home#index"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
