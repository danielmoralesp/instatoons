Rails.application.routes.draw do
  devise_for :users
  root 'application#scrape_toons'

  get 'home', to: 'home#index'
  get 'artistas', to: 'home#artistas'
  get 'instatoons', to: 'home#instatoons'
  get 'artist-profile', to: 'home#artist_profile'
  get 'instatoon', to: 'home#instatoon'

  get 'dashboard', to: 'home#dashboard'

  resources :artists
  resources :toons, except: [:index]
end
