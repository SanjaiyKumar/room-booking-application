class Room < ApplicationRecord
    belongs_to :hotel
    validates :price, presence: true
    validates :room_no , presence: true
    validates :room_no , uniqueness: { scope: :hotel_id , message: " : %{value}  already exists" }
    validates :no_of_beds , presence: {message: " can't be empty"}
    validates :room_type , presence: true
end
