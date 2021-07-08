Rails.application.routes.draw do
  use_doorkeeper 
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :hotels
      resources :users
      get 'hotels/:id/hotelrooms' ,:to => 'hotels#hotelrooms'
      get 'users/:id/userlogs' ,:to => 'users#userlogs'
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'user/index' ,:to => 'user#index' , as: :user_hotel_index
  get 'user/searchhotel' ,:to => 'user#searchhotel' , as: :search_hotel
  get 'user/:id/show' ,:to => 'user#show' , as: :user_hotel_show
  get 'user/:id/roomlist' ,:to => 'user#roomlist' , as: :user_hotel_roomlist
  get 'user/:id/bookingpage' ,:to => 'user#bookingpage' , as: :user_bookingpage
  post 'user/:id/bookingpage' ,:to => 'user#book' 
  get 'logs' , :to => 'user#showlogs' ,as: :logs
  get 'hotellogs' , :to => 'hotel#hotellogs' ,as: :hotellogs 
  get 'hotels/addaddress' , :to => 'hotel#addaddress' ,as: :hoteladdress
  post 'hotels/addaddress' , :to => 'hotel#add' 
  devise_for :hotels
  get '/rooms/:id/changestatus/' , :to => 'rooms#changestatus' , as: :change_status 
  resources :rooms do
    collection { post :import }
  end
  devise_for :users
  
  # root 'home#index'
  root 'rooms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
