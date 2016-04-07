# Airports
puts "Seeding airports"
filename = 'db/csv/airports_codes.csv'
options = {
  col_sep: /tt(?=[^a-l&^n&^p&^s-t&v-z])/,
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

  puts "Seeding airport id: #{item[:airport_id]}"
  airport.save
end

# Coordinates nullify
Airport.where(coordinate_x: 0).update_all(coordinate_x: nil)
Airport.where(coordinate_y: 0).update_all(coordinate_y: nil)
# City nullify
Airport.where(city: '\N').update_all(city: nil)
