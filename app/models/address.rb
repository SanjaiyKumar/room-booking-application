class Address < ApplicationRecord
    validates :location, presence: true 
    belongs_to :pincode
    belongs_to :hotel
end
