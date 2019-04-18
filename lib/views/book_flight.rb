require_relative 'modules/banner'
require_relative 'modules/helpers'
class BookFlightView
  attr_reader :choice
  include Banner

  def initialize
    @prompt = TTY::Prompt.new
    spacer_banner
    book_flight_banner
    options
    validate_cities
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

  def validate_cities
    @d_city = City.where("name=?", @choice[:departure_city]).first
    @a_city = City.where("name=?", @choice[:arrival_city]).first

    @flights = Flight.where('departure_city_id=? and arrival_city_id=?', @d_city.id, @a_city.id)

    if @flights.empty?
      puts "Sorry, there are no flights to those cities"
    else
      print_flights(@flights)
    end
  end


  def print_flights(flights)

    puts "Here are the available flights"
    puts ""
    puts ""
    puts ""
    flights.each_with_index do |flight, index|
      # binding.pry
      puts "SELECTION #{index + 1}"
      puts "-----------------------------------------------"
      puts "Flight number: " + flight[:flight_number]
      puts "Airline: " + flight[:airline]
      puts "Price: " + flight[:price].to_s
      puts "-----------------------------------------------"
      puts ""
    end

  end

  def confirmation
    selection = @prompt.ask('Which flight would you like? Enter the Selection number')
    selected_flight = @flights[selection.to_i - 1]
    UserFlight.create(user_id: $user.id, flight_id: selected_flight.id)
    puts <<-MSG


Here are the details for your upcoming flight

Departure city: #{@d_city.name}
Arrival city: #{@a_city.name}


    MSG
  end
end
