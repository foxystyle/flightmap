class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :code
      t.string :city
      t.string :country
      t.string :country_code
      t.string :continent
      t.decimal :coordinate_x, :precision => 10, :scale => 6
      t.decimal :coordinate_y, :precision => 10, :scale => 6
      t.timestamps null: false
    end
  end
end
