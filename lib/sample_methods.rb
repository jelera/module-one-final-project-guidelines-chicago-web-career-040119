# Book flights



# Destinations
  # o	List Destinations
            # Destination.all

  # o	Read Destination Reviews
            # puts "Select Country"
            # country_name = gets.chomp
            #
            # # def find_dest_by_country(country_name)
            # #   Destination.find_by(country: country_name)
            # # end
            # def get_destination_reviews(country_name)
            #   country_id = Destination.find_by(country: country_name).id
            #   review_data = Review.where(destination_id: country_id)
            #   review_data.map.with_index do |data, index|
            #     puts "#{index + 1}. #{data.content}\n"
            #   end
            # end

            # def get_destination_reviews
            #   Review.find_by(destination_id:)
            # end
  # o	Destination Information - can't add this method until we create a column on the table and seed it
          # def get_destination_information(country_name)
          #
          # end


# My Profile
  # o	My Info
            # 	Change username
            # 	Change name
            # 	Change nationality
#   o	My Flights
      # 	Past flights
      # 	Upcoming flights
      # •	Update My Flights
      # 	All flights
# require 'pastel'
require 'tty-prompt'


prompt = TTY::Prompt.new
# prompt.ask('What is your name?', default: ENV['USER'])
# # prompt.yes?('Do you like Ruby?')

#USE BELOW FOR PASSWORD INPUT
# password = prompt.mask("What is your password?")
# puts "Your password is #{password}"

#USE BELOW FOR LIST OPTIONS
# choices = %w(vodka beer wine whisky bourbon)
# prompt.multi_select("Select drinks?", choices)



# prompt.ask('What is your name?', default: 'No Username')

# prompt.ask('password:', echo: false)


#USE BELOW TO ENTER USERNAME
# prompt.ask('What is your email?') do |q|
#   q.validate(/\A\w+@\w+\.\w+\Z/, 'Invalid email address')
# end

# prompt.multiline("Re")


#USE BELOW FOR REVIEWS
# prompt.multiline("Description?") do |q|
#   q.default 'A super sweet prompt.'
#   q.help 'Press thy ctrl+d to end'
# end

# heart = prompt.decorate('❤ ', :magenta)
# prompt.mask('Password:', mask: heart)
#

#SCROLL DOWN THROUGH A LIST
# letters = ('A'..'Z').to_a
# prompt.select("Choose your letter?", letters, per_page: 4)

#SELECT MUTIPLE CHOICES
# choices = %w(vodka beer wine whisky bourbon)
# prompt.multi_select("Select drinks?", choices)


# choices = %w(vodka beer wine whisky bourbon)
# prompt.multi_select("Select drinks?", choices, filter: true)

# do |q|
# q.in '18-150'
# q.messages[:range?] = '%{value} is not a valid response. Please try again.'


# CREATE NEW USER PROFILE




prompt.collect do

  key(:age).ask('What is your age (1-150)? ') do |q|
    q.in '18-150'
    q.messages[:range?] = '%{value} is not quite old enough to create a profile. Please go get an adult.'
  end

  key(:username).ask('E-mail Address(this will be your username):') do |q|
  q.validate(/\A\w+@\w+\.\w+\Z/)
  q.messages[:valid?] = 'Invalid email address'
  end

  key(:name).ask('First Name')

  key(:name).ask('Last Name')


  key(:address) do
    key(:street).ask('Street?', required: true)
    key(:city).ask('City?')
    key(:zip).ask('Zip?', validate: /\A\d{3}\Z/)
  end


  end
  puts "You're all set! Here are your options:"


# heart = prompt.decorate('❤ ', :magenta)
# prompt.mask('What is your secret?') do |q|
#   q.validate(/{1..15}/)
# end

# prompt.ask('What is your age (1-150)? ') do |q|
#   q.in '18-150'
#   q.messages[:range?] = '%{value} is not quite old enough to create a profile. Please go get an adult.'
# end
# prompt = TTY::Prompt.new(active_color: :magenta)
# prompt.say("HI THERE")
# prompt.warn("stop")
# prompt.error("stop!")


def destination_screen
  list_all_destinations
  destination_info
  read_destination_reviews
end
