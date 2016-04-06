# Airports
filename = 'db/csv/airports_codes.csv'
options = {
  col_sep: /tt(?=[^a-n&^p&^s-t&v-z])/,
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
airports = SmarterCSV.process(filename, options)
airports.each do |item|
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
# itinerary_id / market_id / brand / purchase_date / departure_date /
# return_date / departure_city_tag / departure_city / departure_country /
# departure_country_tag / departure_continent / destination_city_tag /
# destination_city / destination_country / destination_country_tag /
# destination_continent / paid_amount / paid_currency / paid_amount_converted /
# ticket_type / flight_duration
filename = 'db/csv/recently_sold.csv'
options = {
  col_sep: /tt(?=[^a-n&^p&^s-t&v-z])/,
  headers_in_file: false,
  user_provided_headers: [
    "itinerary_id",
    "market_id",
    "brand",
    "purchase_date",
    "departure_date",
    "return_date",
    "departure_city_tag",
    "departure_city",
    "departure_country",
    "departure_country_tag",
    "departure_continent",
    "destination_city_tag",
    "destination_city",
    "destination_country",
    "destination_country_tag",
    "destination_continent",
    "paid_amount",
    "paid_currency",
    "paid_amount_converted",
    "ticket_type",
    "flight_duration"
  ]
}
tickets = SmarterCSV.process(filename, options)
tickets.each do |item|
  ticket = Ticket.new(
    itinerary_id: item[:itinerary_id],
    market_id: item[:market_id],
    brand: item[:brand],
    purchase_date: item[:purchase_date],
    departure_date: item[:departure_date],
    return_date: item[:return_date],
    departure_city_tag: item[:departure_city_tag],
    departure_city: item[:departure_city],
    departure_country: item[:departure_country],
    departure_country_tag: item[:departure_country_tag],
    departure_continent: item[:departure_continent],
    destination_city_tag: item[:destination_city_tag],
    destination_city: item[:destination_city],
    destination_country: item[:destination_country],
    destination_country_tag: item[:destination_country_tag],
    destination_continent: item[:destination_continent],
    paid_amount: item[:paid_amount],
    paid_currency: item[:paid_currency],
    paid_amount_converted: item[:paid_amount_converted],
    ticket_type: item[:ticket_type],
    flight_duration: item[:flight_duration]
  )
  ticket.save
end
