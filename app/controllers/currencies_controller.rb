class CurrenciesController < ApplicationController

  def index
    @currencies = Ticket.distinct.pluck(:paid_currency)
    # render status:200, json: { currencies: @currencies }
    render status:200, json: { currencies: ["HRK"] } # temporary
  end

end
