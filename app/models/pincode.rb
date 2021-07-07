class Pincode < ApplicationRecord
    validates :pincode, presence: true 
    has_many :addresses
end
