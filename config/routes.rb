Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'services#profile'
  
  resources :services do
    resources :bookings, only: %i[create]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: %i[index show destroy]  
end
