class Hotel < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :rooms, dependent: :destroy
         has_many :logs
         has_one :address
         has_one :pincode, :through => :address
         PASSWORD_FORMAT = /\A
         (?=.{8,})         
         (?=.*\d)           
         (?=.*[a-z])       
         (?=.*[A-Z])        
         (?=.*[[:^alnum:]]) 
       /x
       validates :password, 
        presence: true, 
        length: { in: Devise.password_length }, 
        format: { with: PASSWORD_FORMAT }, 
        confirmation: true, 
        on: :create 
        validates :password, 
          allow_nil: true, 
          length: { in: Devise.password_length }, 
          format: { with: PASSWORD_FORMAT }, 
          confirmation: true, 
          on: :update
end
