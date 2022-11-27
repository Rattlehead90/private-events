Rails.application.routes.draw do
  get 'event_attendances/create'
  get 'event_attendances/destroy'
  get 'event_attendances/update'
  devise_for :users
  root 'events#index'

  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
