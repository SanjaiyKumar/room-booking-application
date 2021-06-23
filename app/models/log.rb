class Log < ApplicationRecord
    belongs_to :hotel
    belongs_to :user
    validates :start_date , presence: true
    validates :end_date , presence: true 
    after_save :statusUpdate

    def statusUpdate
        @stat = !$rom.status
        $rom.update(status: @stat)
    end
end
