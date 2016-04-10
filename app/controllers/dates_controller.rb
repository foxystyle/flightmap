class DatesController < ApplicationController

  def index
    @years = Ticket.pluck(:departure_date).map(&:year).uniq
    render status:200, json: { years: @years }
  end

end
