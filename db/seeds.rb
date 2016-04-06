# Airports
filename = 'db/csv/airports_codes.csv'
options = {
  col_sep: /tt(?=[^t])/,
  headers_in_file: false,
  user_provided_headers: [
    "airport_id",
    "code",
    "city",
    "country",
    "country_code",
    "continent",
    "coordinate_x",
    "coordinate_y"
  ]
}
records = SmarterCSV.process(filename, options)
records.each do |item|
  airport = Airport.new(
    airport_id: item[:airport_id],
    code: item[:code],
    city: item[:city],
    country: item[:country],
    country_code: item[:country_code],
    continent: item[:continent],
    coordinate_x: item[:coordinate_x],
    coordinate_y: item[:coordinate_y]
  )
  airport.save
end


# Tickets
# itinerary_id / market_id / brand / purchase_time / departure_date /
# return_date / departure_city_tag / departure_city / departure_country /
# departure_country_tag / departure_continent / destination_city_tag /
# destination_city / destination_country / destination_country_tag /
# destination_continent / paid_amount / paid_currency / paid_amount_converted /
# ticket_type / flight_duration
filename = 'db/csv/recently_sold'
options = {
  col_sep: /tt(?=[^t])/,
  headers_in_file: false,
  user_provided_headers: [
  ]
}
