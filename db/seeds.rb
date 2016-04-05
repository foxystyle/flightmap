# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

filename = 'db/csv/airports_codes.csv'
options = {
  :col_sep => 'tt',
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

puts records
