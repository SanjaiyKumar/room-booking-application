class Address < ApplicationRecord
    belongs_to :pincode
    belongs_to :hotel
end
