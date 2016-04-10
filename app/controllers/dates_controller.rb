class DatesController < ApplicationController

  def index
    @years = Ticket.pluck(:departure_date).map(&:year).uniq
    @months = [
      {no: 1, name: 'Siječanj'},
      {no: 2, name: 'Veljača'},
      {no: 3, name: 'Ožujak'},
      {no: 4, name: 'Travanj'},
      {no: 5, name: 'Svibanj'},
      {no: 6, name: 'Lipanj'},
      {no: 7, name: 'Srpanj'},
      {no: 8, name: 'Kolovoz'},
      {no: 9, name: 'Rujan'},
      {no: 10, name: 'Listopad'},
      {no: 11, name: 'Studeni'},
      {no: 12, name: 'Prosinac'}
    ]
    render status:200, json: {
       years: @years,
       months: @months
     }
  end

end
