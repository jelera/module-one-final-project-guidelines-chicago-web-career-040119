require_relative 'modules/banner.rb'
require_relative 'modules/helpers.rb'

class MyProfileView
  include Banner
  include Helper

  def initialize
    @prompt = TTY::Prompt.new
    spacer_banner
    my_profile_banner
    my_profile_tasks
  end

def my_profile_main_menu

    @choice = @prompt.select("What would you like to do?") do |menu|
    menu.per_page 4
    menu.page_help '(Use arrow keys to navigate up or down)'

      menu.choice 'View My Info', 1
      menu.choice 'Change My Info', 2
      menu.choice 'View My Reviews', 3
      menu.choice 'Write New Review', 4
      menu.choice 'View My Flights', 5
      menu.choice 'Change My Flights', 6
      menu.choice 'Go back to to main menu', 7
      menu.choice 'Exit Program', 8
    end
end

def my_profile_tasks
  case my_profile_main_menu
      when 1
        # puts "#{$user}"
        profile = $user
        puts profile.first_name
        puts profile.last_name
        puts profile.age
        puts profile.address
        puts profile.email
        puts profile.password

        my_profile_main_menu
      when 2
        user = @prompt.collect do

          key(:age).ask('What is your age (1-150)? ') do |q|
            q.in '18-150'
            q.messages[:range?] = '%{value} is not quite old enough to create a profile. Please go get an adult.'
          end

          key(:username).ask('E-mail Address(this will be your username):') do |q|
          q.validate(/\A\w+@\w+\.\w+\Z/)
          q.messages[:valid?] = 'Invalid email address'
          end

          key(:password).ask('Create a password:')

          key(:first_name).ask('First Name')

          key(:last_name).ask('Last Name')

          key(:address) do
            key(:street).ask('Street?', required: true)
            key(:city).ask('City?')
            key(:state).ask('State?')
            key(:zip).ask('Zip?', validate: /\A\d{3}\Z/)
          end

          key(:country_origin).ask('Country of Origin: ')

        end
        $user.update(
          first_name: user[:first_name],
          last_name: user[:last_name],
          age: user[:age],
          address: "#{user[:street]}, #{user[:city]}, #{user[:state]} #{user[:zip]}",
          email: user[:username],
          password: user[:password],
          country_origin: user[:country_origin]
        )
        puts my_profile_main_menu

      when 3
      if !$user.reviews.empty?
       $user.reviews.each do |r|
         puts "========================="
           puts "Rating: #{r.rating}"
           puts ""
           puts r.body
           puts "========================"
           puts ""
           my_profile_main_menu
         end
       else
         puts "You haven't written any reviews yet."
         my_profile_main_menu
       end

      when 4
        # @prompt.ask("Enter the destination you'd like to review:")
      when 5
        $user.flights.each_with_index do |flight, index|
            # binding.pry
            puts "Flight #{index + 1}"
            puts "-----------------------------------------------"
            puts "Flight number: " + flight[:flight_number]
            puts "Airline: " + flight[:airline]
            puts "Price: " + flight[:price].to_s
            puts "-----------------------------------------------"
            puts ""
          end
      when 6
        # puts " Change flight"
      when 7
        go_back_to_main_screen
      when 8
        system 'clear'
        exit
      end
    end


end #end of class



    # @choice = @prompt.select("What would you like to do?") do |menu|
    #   menu.default 1
    #
    #   menu.choice 'My Info', 1
    #   menu.choice 'My Flights', 2
    #   menu.choice 'My Reviews', 3
    #   menu.choice 'Go back to the main screen', 4
    #   menu.choice 'Exit Program', 5
    #   # menu.choice 'Return to Main Menu', 4
    # end



#   def my_info_options
#     case my_profile_main_menu
#     when 1
#       @prompt.select("My Info") do |menu|
#         menu.default 1
#
#         menu.choice 'Change Username', 1
#         menu.choice 'Change Password', 2
#         menu.choice 'Change Name', 3
#         menu.choice 'Change Address', 4
#         menu.choice 'Go back to My Profile menu', 5
#         end
#       end
#     end
#
# def my_flights_options
#   case my_profile_main_menu
#     when 2
#       @prompt.select("My Flights") do |menu|
#         menu.default 1
#
#         menu.choice 'All Flights', 2
#         menu.choice 'Past Flights', 3
#         menu.choice 'Upcoming Flights', 4
#         menu.choice 'Update My Flights', 5
#         menu.choice 'Go back to My Profile menu', 6
#       end
#     end
#   end
#
#   def my_reviews_options
#     case my_profile_main_menu
#     when 3
#       @prompt.select("My Reviews") do |menu|
#         menu.default 1
#
#         menu.choice 'Write a New Review', 1
#         menu.choice 'Read My Reviews', 2
#         menu.choice 'Update an Existing Review', 3
#         menu.choice 'Go back to My Profile menu', 4
#       end
#     end
#   end
#
# def my_info_tasks
#   case my_info_tasks
#     when 1
#
#     when 2
#
#     when 3
#
#     when 4
#
#     when 5
#       my_profile_main_menu
#     end
#   end
#
#   def my_flights_tasks
#     case my_flights_options
#       when 1
#
#       when 2
#
#       when 3
#
#       when 4
#
#       when 5
#
#       when 6
#         my_profile_main_menu
#       end
#     end
#
#     def my_reviews_tasks
#       case my_reviews_options
#         when 1
#
#         when 2
#
#         when 3
#
#         when 4
#           my_profile_main_menu
#         end
#       end

# def return_to_my_profile
#   my_profile_main_menu
# end

  # def main
  # end
