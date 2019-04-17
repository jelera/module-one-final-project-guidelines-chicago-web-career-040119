require 'tty-prompt'
require_relative 'modules/banner'
require_relative 'modules/helpers'

class MainScreen
  include Banner
  include Helper

  def initialize
    @company_name = "Starflights.com"
    @prompt = TTY::Prompt.new
    @choice = nil
  end
  #---------------------------------------------------#
  # => SCREENS
  #---------------------------------------------------#

  def login_screen
    system 'clear'
    welcome_children_banner
    @username = @prompt.ask('What is your username?', default: ENV['USER'])
    # Uncomment when proper authentication is implemented
    # @password = @prompt.mask("Enter your password")
  end

  def welcome_screen
    system 'clear'
    company_banner
    welcome_user_banner
  end

  def book_flight_screen
    spacer_banner
    book_flight_banner
    book_flight_menu
    book_flight_confirmation
  end

  #---------------------------------------------------#
  # => CONFIRMATION MESSAGES
  #---------------------------------------------------#
  def book_flight_confirmation
    puts <<-MSG


Here are the details for your upcoming flight

Departure city: #{@choice[:departure_city]}
Arrival city: #{@choice[:arrival_city]}


    MSG
    
  end


  #---------------------------------------------------#
  # => MENUS
  #---------------------------------------------------#

  def menu_choice(screen_title)
    case screen_title

      when 'main'
        @choice = @prompt.select("How may I be of service?") do |menu|
          menu.default 1

          menu.choice 'Book a Flight', 1
          menu.choice 'Destinations', 2
          menu.choice 'My Profile', 3
        end
        
      when 'book_flight'
        @choice = @prompt.collect do

          key(:departure_city).ask("Enter your departure city", required: true, default: 'Chicago') do |q|
          # q.validate
          end

          key(:arrival_city).ask("Enter your arrival city", required: true, default: 'New York City') do |q|
          # q.validate
          end
        end
    end
  end

  def main_menu
    menu_choice("main")
    case @choice
    when 1
      book_flight_screen
    end
  end

  def book_flight_menu
    menu_choice("book_flight")
  end

  #---------------------------------------------------#
  # => MAIN
  #---------------------------------------------------#
  def main
    login_screen
    welcome_screen
    main_menu
  end
end

main_screen = MainScreen.new
main_screen.main
