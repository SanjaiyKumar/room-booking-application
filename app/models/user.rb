class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :logs
         has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks
           
           def self.authenticate(email, password)
            user = User.find_for_authentication(email: email)
            user&.valid_password?(password) ? user : nil
          end

          def active_for_authentication?
            super && !self.ban_status
          end
       
          def inactive_message
            "Your account has been banned"
          end
end
