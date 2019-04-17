require 'tty-prompt'
require 'pry'
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
    is_new_user? ? create_user : @username = @prompt.ask('What is your username?', default: ENV['USER'])
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

  def destinations_screen
    destinations_menu
  end

  def my_profile_screen

  end
  #---------------------------------------------------#
  # => CONFIRMATION MESSAGES
  #---------------------------------------------------#
  def book_flight_confirmation
    book_flight_confirmation_banner
  end

  def destination_confirmation
    
  end


  def my_profile_confirmation
    
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
      when 'destinations'
        @choice = @prompt.select("These are your options") do |menu|
          menu.default 1

          menu.choice 'Read information about a destination', 1
          menu.choice 'View Destinations by City', 2
          menu.choice 'List all destinations', 3
          menu.choice 'Read reviews about a destination', 4
        end
      when 'my_profile'
        ''
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
  # => DATA PROCESSING
  #---------------------------------------------------#

  def create_user
    user = @prompt.collect do

      key(:age).ask('What is your age (1-150)? ') do |q|
        q.in '18-150'
        q.messages[:range?] = '%{value} is not quite old enough to create a profile. Please go get an adult.'
      end

      key(:username).ask('E-mail Address(this will be your username):') do |q|
      q.validate(/\A\w+@\w+\.\w+\Z/)
      q.messages[:valid?] = 'Invalid email address'
      end

      # key(:password).ask('Create a password:') do

      key(:first_name).ask('First Name')

      key(:last_name).ask('Last Name')

      key(:address) do
        key(:street).ask('Street?', required: true)
        key(:city).ask('City?')
        key(:zip).ask('Zip?', validate: /\A\d{3}\Z/)
      end


    end
    @username = user[:username]
    @first_name = user[:first_name]
    @last_name = user[:last_name]
    @full_name = "#{@first_name} #{@last_name}"


    puts "You're all set! Here are your options:"
  end

  def is_new_user?
    !@prompt.yes?("Do you have a #{@company_name} account?")
  end


  #---------------------------------------------------#
  # => MAIN
  #---------------------------------------------------#
  def main
    login_screen
    welcome_screen
    main_menu
  end



end #end class

main_screen = MainScreen.new
main_screen.main
