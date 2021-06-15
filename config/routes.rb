Rails.application.routes.draw do
  devise_for :hotels
  get '/rooms/:id/changestatus/' , :to => 'rooms#changestatus' , as: :change_status 
  resources :rooms
  devise_for :users
  
  # root 'home#index'
  root 'rooms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
