class Log < ApplicationRecord
    belongs_to :hotel
    belongs_to :user
    belongs_to :room
    validates :start_date , presence: true
    validates :end_date , presence: true 
    validate :validDate
    after_save :statusUpdate

    def statusUpdate
        room = Room.find(self.room_id)
        if !room.nil?
            @stat = !room.status
            room.update(status: @stat)
        end
    end

    private
    def validDate
        if Date.parse(start_date) < Date.today
            self.errors.add(:start_date,:must_valid,message: "Invalid Booking Start Date")
        end
        if Date.parse(start_date) > Date.parse(end_date) 
            self.errors.add(:start_date,:must_valid,message: "Invalid Booking Start Date")
        end
    end

end
