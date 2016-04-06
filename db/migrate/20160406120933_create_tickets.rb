class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :itinerary_id
      t.integer :market_id
      t.string :brand
      t.datetime :purchase_date
      t.date :departure_date
      t.date :return_date
      t.string :departure_city_tag
      t.string :departure_city
      t.string :departure_country
      t.string :departure_country_tag
      t.string :departure_continent
      t.string :destination_city_tag
      t.string :destination_city
      t.string :destination_country
      t.string :destination_country_tag
      t.string :destination_continent
      t.decimal :paid_amount
      t.string :paid_currency
      t.decimal :paid_amount_converted
      t.string :ticket_type
      t.integer :flight_duration

      t.timestamps null: false
    end
  end
end
