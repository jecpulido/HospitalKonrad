Rails.application.routes.draw do

  get 'schedules/find_schedules'
  post 'schedules/create_schedules'
  resources :appointments
  resources :schedules
  resources :doctors
  resources :profesions
  resources :patients
  resources :states
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
