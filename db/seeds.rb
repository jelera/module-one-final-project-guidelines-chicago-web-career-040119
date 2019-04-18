require "faker"

30.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    country_origin: Faker::WorldCup.team,
    age: (18..79).to_a.sample,
    email: Faker::Internet.free_email,
    address: Faker::Address.full_address,
    password: Faker::Internet.password
  )
end

20.times {
  City.create(
    name: Faker::Nation.unique.capital_city,
    planet: Faker::Movies::StarWars.unique.planet
  )
}

100.times {
  Destination.create(
    name: Faker::Movies::LordOfTheRings.unique.location,
    description: Faker::Lorem.paragraph(3),
    city_id: (1..20).to_a.sample
  )
}



30.times {
  Review.create(
    body: Faker::TvShows::MichaelScott.unique.quote,
    rating: (1..5).to_a.sample,
    destination_id: (1..20).to_a.sample,
    user_id: (1..30).to_a.sample
  )
}



# 40.times {

#   flight = Flight.create(
#     flight_number: Faker::Number.unique.number(3),
#     airline: "#{Faker::TvShows::GameOfThrones.dragon} Airlines",
#     price: Faker::Number.decimal(3, 2)
#   )

#   departure_dest = (1..20).to_a.sample
#   arrival_dest = ((1..20).to_a - [departure_dest]).sample

#   FlightEvent.create(
#     time: Faker::Time.between(DateTime.now - 30, DateTime.now),
#     is_departure: true,
#     destination_id: departure_dest,
#     flight_id: flight.id
#   )

#   FlightEvent.create(
#     time: Faker::Time.between(DateTime.now, DateTime.now + 30),
#     is_departure: false,
#     destination_id: arrival_dest,
#     flight_id: flight.id
#   )
#   puts "Created flight from #{Destination.find(departure_dest).name} to #{Destination.find(arrival_dest).name}"
# }


# 30.times { UsersFlight.create(
#   user_id: (1..30).to_a.sample,
#   flight_id: (1..40).to_a.sample
#   )}



#   # users
#   # destinations
#   # reviews
#   # flights
#   #
#   # flight event
#   # user flights
