# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

filename = 'db/csv/airports_codes.csv'
options = {
  :col_sep => /tt(?=[^t])/,
  :headers_in_file => false,
  :user_provided_headers => [
    "id",
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
    id: item[:id],
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
