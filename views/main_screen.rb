require 'tty-prompt'
require 'pry'
require_relative 'modules/banner'
require_relative 'modules/helpers'
require_relative 'login'
require_relative 'book_flight'
require_relative 'destinations'
require_relative 'my_profile'

class MainScreen
  include Banner
  include Helper

  def initialize
    $COMPANY_NAME = "Starflights.com"
    $user = {}
    @prompt = TTY::Prompt.new
  end

  def welcome_screen
    system 'clear'
    company_banner
    welcome_user_banner
  end

  def menu_choice
    @choice = @prompt.select("How may I be of service?") do |menu|
      menu.default 1

      menu.choice 'Book a Flight', 1
      menu.choice 'Destinations', 2
      menu.choice 'My Profile', 3
      menu.choice 'Exit Program', 4
    end
  end

  def main_menu
    case menu_choice
    when 1
      book_flight = BookFlight.new
    when 2
      destinations = Destination.new
    when 3
       my_profile = MyProfile.new
      # my_profile_screen
    when 4
      system 'clear'
      exit
    end
  end

  def main
    Login.new
    welcome_screen
    main_menu
  end


end #end class

$main_screen = MainScreen.new
$main_screen.main
