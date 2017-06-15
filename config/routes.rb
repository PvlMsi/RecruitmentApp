Rails.application.routes.draw do
  resources :applications

  root 'static_pages#home'

  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  get 'register', to: 'users#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'apply', to: 'applications#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
