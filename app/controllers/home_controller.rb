class HomeController < ApplicationController

  def index
  end

  def airports
    @airports = Airport.all
    render status:200, json: { airports: @airports }
  end

end
