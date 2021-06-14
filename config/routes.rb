Rails.application.routes.draw do
  devise_for :hotels
  get '/rooms/changestatus' , :to => 'rooms#changestatus'
  resources :rooms
  devise_for :users
  
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
