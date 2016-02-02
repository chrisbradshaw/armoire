Rails.application.routes.draw do

  root to: 'home#index'
  devise_for :users

  resources :users
  resources :outfits
  resources :accessories
  resources :shoes
  resources :garments
  get 'random', to: 'outfits#random', as: 'random_outfit'
  get 'help'    => 'home#help'
  get 'about'   => 'home#about'
  get 'contact' => 'home#contact'

  get 'delete/:id' => 'garments#destroy', as: 'garment_destroy'
  get 'delete_accessories/:id' => 'accessories#destroy', as: 'accessory_delete'
  get 'delete_shoes/:id' => 'shoes#destroy', as: 'shoes_delete'


end
