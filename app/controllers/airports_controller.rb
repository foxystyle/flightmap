class AirportsController < ApplicationController

  def index
    @airports = Airport.select('id,city,country,country_code')
    render status:200, json: { airports: @airports }
  end

  def show
   @airport = Airport.find_by_id(params[:id])
   render status:200, json: {
     airport_name: @airport.code,
     airport_city: @airport.city,
     airport_country: @airport.country,
     airport_country_tag: @airport.country_tag
   }
  end

end
