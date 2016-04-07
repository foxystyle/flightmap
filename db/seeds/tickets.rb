# Tickets
puts "Seeding tickets"
filename = 'db/csv/recently_sold.csv'
options = {
  col_sep: /tt(?=[^a-l&^n&^p&^s-t&^v-z])/,
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
  puts "Seeding ticket id: #{item[:itinerary_id]}..."
  ticket.save
end

# Ticket ticket_type : "multi" fix
Ticket.where(ticket_type: "0").update_all(ticket_type: "multi")

# Ticket return_date : nullify
Ticket.where(return_date: "1970-01-01").update_all(return_date: nil)
