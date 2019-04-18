class BookFlight
  attr_reader :choice
  include Banner

  def initialize
    @prompt = TTY::Prompt.new
    spacer_banner
    book_flight_banner
    options
    confirmation
  end

  def options
    @choice = @prompt.collect do

      key(:departure_city).ask("Enter your departure city", required: true, default: 'Chicago') do |q|
      # q.validate
      end

      key(:arrival_city).ask("Enter your arrival city", required: true, default: 'New York City') do |q|
      # q.validate
      end
    end
  end

  def confirmation
    puts <<-MSG


Here are the details for your upcoming flight

Departure city: #{@choice[:departure_city]}
Arrival city: #{@choice[:arrival_city]}


    MSG
  end
end
