Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get 'artist', to: 'home#artist'
end
