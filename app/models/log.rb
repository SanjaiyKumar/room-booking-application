class Log < ApplicationRecord
    belongs_to :hotel
    belongs_to :user
    validates :start_date , presence: true
    validates :end_date , presence: true 
    validate :validDate
    after_save :statusUpdate

    def statusUpdate
        if !$rom.nil?
            @stat = !$rom.status
            $rom.update(status: @stat)
        end
    end

    private
    def validDate
        if Date.parse(start_date) < Date.today
            self.errors.add(:start_date,:must_valid,message: "Invalid Booking Date")
        end
        if Date.parse(start_date) > Date.parse(end_date) 
            self.errors.add(:start_date,:must_valid,message: "Invalid Booking Date")
        end
    end

end
