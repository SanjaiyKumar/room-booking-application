Rails.application.routes.draw do
  get 'user/index' ,:to => 'user#index' , as: :user_hotel_index
  get 'user/:id/show' ,:to => 'user#show' , as: :user_hotel_show
  get 'user/:id/showroom' ,:to => 'user#showroom' , as: :user_hotel_showroom
  get 'user/:id/bookingpage' ,:to => 'user#bookingpage' , as: :user_bookingpage
  devise_for :hotels
  get '/rooms/:id/changestatus/' , :to => 'rooms#changestatus' , as: :change_status 
  resources :rooms
  devise_for :users
  
  # root 'home#index'
  root 'rooms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
