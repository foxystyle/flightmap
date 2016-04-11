class DatesController < ApplicationController

  def index
    @years = Ticket.pluck(:departure_date).map(&:year).uniq
    @months = [
      {no: '01', name: 'Siječanj'},
      {no: '02', name: 'Veljača'},
      {no: '03', name: 'Ožujak'},
      {no: '04', name: 'Travanj'},
      {no: '05', name: 'Svibanj'},
      {no: '06', name: 'Lipanj'},
      {no: '07', name: 'Srpanj'},
      {no: '08', name: 'Kolovoz'},
      {no: '09', name: 'Rujan'},
      {no: '10', name: 'Listopad'},
      {no: '11', name: 'Studeni'},
      {no: '12', name: 'Prosinac'}
    ]
    render status:200, json: {
       years: @years,
       months: @months
     }
  end

end
