json.extract! room, :id, :hotel_name, :status, :price, :type, :no_of_beds, :created_at, :updated_at
json.url room_url(room, format: :json)
