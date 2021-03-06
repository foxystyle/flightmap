class TicketsController < ApplicationController

  def index
    @tickets = Ticket.select(
      'id',
      'departure_date',
      'departure_country',
      'departure_city',
      'destination_country_tag',
      'paid_amount_converted',
      'flight_duration'
    )
    render status:200, json: { tickets: @tickets}
  end

=begin
  def show
   @tickets = Ticket.where(params[:id])
   render status:200, json: {
     id: @ticket.id,
     departure_date: @ticket.departure_date,
     departure_country: @ticket.departure_country,
     departure_country_tag: @ticket.departure_country_tag,
     destination_country: @ticket.destination_country,
     destination_country_tag: @ticket.destination_country_tag,
     paid_amount: @ticket.paid_amount,
     paid_currency: @ticket.paid_currency,
     flight_duration: @ticket.flight_duration
   }
  #end
=end
end
