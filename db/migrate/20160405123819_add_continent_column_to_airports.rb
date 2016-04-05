class AddContinentColumnToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :continent, :string
  end
end
