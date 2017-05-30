Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get 'artist', to: 'home#artist'
  get 'instatoons', to: 'home#instatoons'
  get 'artist-profile', to: 'home#artist_profile'
  get 'instatoon', to: 'home#instatoon'

  get 'dashboard', to: 'home#dashboard'

  resources :artists, except: [:index]
  resources :toons, except: [:index]
end
