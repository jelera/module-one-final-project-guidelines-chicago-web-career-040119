require 'tty-prompt'
require_relative 'modules/banner.rb'

class MyProfile
  include Banner

  def initialize
    @prompt = TTY::Prompt.new
    spacer_banner
    my_profile_banner
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

  def tasks
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
        menu.default 1

        menu.choice 'All Flights', 1
        menu.choice 'Past Flights', 2
        menu.choice 'Upcoming Flights', 3
        menu.choice 'Update My Flights', 4
        menu.choice 'Go back to My Profile menu', 5
      end
    when 3
      @prompt.select("My Reviews") do |menu|
        menu.default 1

        menu.choice 'Write a New Review', 1
        menu.choice 'Read My Reviews', 2
        menu.choice 'Update an Existing Review', 3
        menu.choice 'Go back to My Profile menu', 4
      end
    end

  end

  # def main
  # end

end
