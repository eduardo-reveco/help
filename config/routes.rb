Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :services do
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: %i[index show destroy]  
end
