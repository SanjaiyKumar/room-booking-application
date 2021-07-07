class Room < ApplicationRecord
    belongs_to :hotel
    validates :price, presence: true
    validates :room_no , presence: true
    validates :room_no , uniqueness: { scope: :hotel_id , message: " : %{value}  already exists" }
    validates :no_of_beds , presence: {message: " can't be empty"}
    validates :room_type , presence: true

    def self.to_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |room|
                csv<< room.attributes.values_at(*column_names)
            end
        end
    end
end
