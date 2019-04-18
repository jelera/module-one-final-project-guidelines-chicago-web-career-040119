user_number = 50
flight_number = 20
destination_number = 80
review_number = 50

user_number.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    country_origin: Faker::WorldCup.team,
    age: (18..79).to_a.sample,
    email: Faker::Internet.free_email,
    address: Faker::Address.full_address,
    password: Faker::Internet.password
  )
  puts "Created user: #{user.full_name} from #{user.country_origin}"
end

City.create(name: 'Chicago', country: 'USA')
City.create(name: 'New York City', country: 'USA')
City.create(name: 'Los Angeles', country: 'USA')
City.create(name: 'Las Vegas', country: 'USA')
City.create(name: 'Miami', country: 'USA')
City.create(name: 'Seattle', country: 'USA')
City.create(name: 'Washington, D.C.', country: 'USA')
City.create(name: 'Detroit', country: 'USA')
City.create(name: 'Denver', country: 'USA')
City.create(name: 'New Orleans', country: 'USA')
City.create(name: 'London', country: 'UK')
City.create(name: 'Glasgow', country: 'UK')
City.create(name: 'Paris', country: 'France')
City.create(name: 'Madrid', country: 'Spain')
City.create(name: 'Barcelona', country: 'Spain')
City.create(name: 'Valencia', country: 'Spain')
City.create(name: 'Frankfurt', country: 'Germany')
City.create(name: 'Lima', country: 'Peru')
City.create(name: 'Buenos Aires', country: 'Argentina')
City.create(name: 'Sao Paulo', country: 'Brazil')
City.create(name: 'Bogota', country: 'Colombia')
City.create(name: 'Mexico D.F.', country: 'Mexico')

# 20.times {
#   City.create(
#     name: Faker::Nation.unique.capital_city,
#     country: Faker::Movies::StarWars.unique.planet
#   )
# }

destination_number.times {
  destination = Destination.create(
    name: Faker::Movies::LordOfTheRings.unique.location || Faker::Movies::HarryPotter.unique.location || Faker::TvShows::RickAndMorty.unique.location,
    description: Faker::Lorem.paragraph(4),
    city_id: (1..22).to_a.sample
  )
  puts "Created Destination: #{destination.name}"
}



review_number.times {
  review = Review.create(
    # body: Faker::TvShows::MichaelScott.unique.quote || Faker::TvShows::GameOfThrones.unique.quote || Faker::TvShows::HowIMetYourMother.unique.quote,
    body: Faker::Hipster.paragraph(2, false, 4),
    rating: (1..5).to_a.sample,
    destination_id: (1..destination_number).to_a.sample,
    user_id: (1..user_number).to_a.sample
  )
  puts "Created: Reviews with rating = #{review.rating}"
}



flight_number.times {

  departure_city_id = (1..22).to_a.sample
  arrival_city_id = ((1..22).to_a - [departure_city_id]).sample

  d_hour = (1..23).to_a.sample
  d_minute = (0..59).to_a.sample
  a_hour = (1..23).to_a.sample
  a_minute = (0..59).to_a.sample

  flight = Flight.create(
    flight_number: Faker::Number.unique.number(3),
    airline: "#{Faker::TvShows::GameOfThrones.dragon} Airlines",
    price: Faker::Number.decimal(3, 2),
    departure_city_id: departure_city_id,
    departure_time: Chronic.parse("#{d_hour}:#{d_minute}"),
    arrival_city_id: arrival_city_id,
    arrival_time: Chronic.parse("#{a_hour}:#{a_minute}")
  )

}

  # arrival_dest = (1..20).to_a.sample
  # arrival_dest = ((1..20).to_a - [arrival_dest]).sample

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
# # }


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
