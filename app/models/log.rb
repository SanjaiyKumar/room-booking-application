class Log < ApplicationRecord
    belongs_to :hotel
    belongs_to :user
    validates :start_date , presence: true
    validates :end_date , presence: true 
end
