Rails.application.routes.draw do
  resources :applications
  resources :offers
  resources :users
  resources :divisions

  root 'static_pages#home'

  get 'settings', to: 'static_pages#settings'
  get 'newOffer', to: 'offers#new'
  get 'newDivision', to: 'divisions#new'

  get 'login', to: 'sessions#new'
  get 'register', to: 'users#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'change_pending' => 'applications#change_pending'
  get 'change_positive' => 'applications#change_positive'
  get 'change_negative' => 'applications#change_negative'

  get 'apply', to: 'applications#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
