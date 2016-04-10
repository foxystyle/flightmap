class CurrenciesController < ApplicationController

  def index
    @currencies = Ticket.distinct.pluck(:paid_currency)
    render status:200, json: { currencies: @currencies }
  end

end
