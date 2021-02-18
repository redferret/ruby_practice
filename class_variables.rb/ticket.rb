# *****************************************************************************
# Simple example of using a Class Variable
# *****************************************************************************

class Ticket
  @@TICKET_count = 1000 # class variable

  attr_reader :ticket_id

  def initialize
    @@TICKET_count += 1
    @ticket_id = @@TICKET_count
  end

end

ticket_1 = Ticket.new
puts ticket_1.ticket_id

ticket_2 = Ticket.new
puts ticket_2.ticket_id

ticket_3 = Ticket.new
puts ticket_3.ticket_id
