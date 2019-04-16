require "faker"

30.times { User.create( name: Faker::TvShows::Simpsons.unique.character,
                        nationality: Faker::Nation.nationality ) }

20.times { Destination.create(name: Faker::Nation.unique.capital_city  ,
                              country: Faker::Movies::StarWars.unique.planet)}

30.times { Review.create(
  content: Faker::TvShows::MichaelScott.unique.quote,
  rating: (1..5).to_a.sample,
  destination_id: (1..20).to_a.sample,
  user_id: (1..30).to_a.sample,
  )}

  80.times { FlightEvent.create(
    time: Faker::Time.between(DateTime.now - 30, DateTime.now),
    is_departure: Faker::Boolean.boolean(0.5),
    destination_id: (1..20).to_a.sample
  )}

40.times { Flight.create(
  flight_number: Faker::Number.unique.number(3),
  airline: "#{Faker::TvShows::GameOfThrones.dragon} Airlines",
  arrival_id: (1..20).to_a.sample,
  departure_id: (1..20).to_a.sample,
  price: Faker::Number.decimal(3, 2)
  )}


30.times { UsersFlight.create(
  user_id: (1..30).to_a.sample,
  flight_id: (1..40).to_a.sample
  )}



  # users
  # destinations
  # reviews
  # flights
  #
  # flight event
  # user flights
