require 'tty-prompt'
require_relative 'modules/banner.rb'

class MyProfile
  include Banner

  def initialize
    @prompt = TTY::Prompt.new
    spacer_banner
    my_profile_banner
    nested_options
    tasks
  end

  def options
    @choice = @prompt.select("What would you like to do?") do |menu|
      menu.default 1

      menu.choice 'My Info', 1
      menu.choice 'My Flights', 2
      menu.choice 'My Reviews', 3
      menu.choice 'Go back to the main screen', 4
      menu.choice 'Exit Program', 5
      # menu.choice 'Return to Main Menu', 4
    end
  end


  def nested_options
    case options
    when 1
      @prompt.select("My Info") do |menu|
        menu.default 1

        menu.choice 'Change Username', 1
        menu.choice 'Change Password', 2
        menu.choice 'Change Name', 3
        menu.choice 'Change Address', 4
        menu.choice 'Go back to My Profile menu', 5

      end

    when 2
      @prompt.select("My Flights") do |menu|
        menu.default 6

        menu.choice 'All Flights', 6
        menu.choice 'Past Flights', 7
        menu.choice 'Upcoming Flights', 8
        menu.choice 'Update My Flights', 9
        menu.choice 'Go back to My Profile menu', 10
      end
    when 3
      @prompt.select("My Reviews") do |menu|
        menu.default 11

        menu.choice 'Write a New Review', 11
        menu.choice 'Read My Reviews', 12
        menu.choice 'Update an Existing Review', 13
        menu.choice 'Go back to My Profile menu', 14
      end
    end
  end

def tasks
  case nested_options
    when 1

    when 2

    when 3

    when 4

    when 5

    when 6

    when 7

    when 8

    when 9

    when 10

    when 11

    when 12

    when 13

    when 14
    end


end

  # def main
  # end

end
