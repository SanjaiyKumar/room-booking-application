FactoryBot.define do
  factory :room do
    room_no {"A06"}
    room_type {"AC"}
    no_of_beds {4}
    price {500}
    hotel_id {}
    hotel_name {"Paradox"}
    status {true}
  end
end
