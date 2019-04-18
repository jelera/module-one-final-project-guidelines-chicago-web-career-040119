require_relative 'modules/banner'
require_relative 'modules/helpers'

class LoginView
  include Banner
  attr_reader :user

  def initialize
    @prompt = TTY::Prompt.new
    main_screen
  end

  def main_screen
    system 'clear'
    welcome_children_banner

    if is_new_user?
      create_user
    else
      @username = @prompt.ask('What is your username?', default: ENV['USER'])
    end

    validate_login
    # @password = @prompt.mask("Enter your password")
  end

  def validate_login
    user = User.where('email=?', @username)
    if !user || user.count == 0
      puts "Sorry, your email is not associated with an existing"
      # answer = @prompt.yes?("Would you like to create one?")
      # if answer
      #   create_user
      # else
      #   exit
      # end
      exit

    else
      $user = user
    end
  end

  def is_new_user?
    !@prompt.yes?("Do you have a #{$COMPANY_NAME} account?")
  end

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
    $user = User.create(
      first_name: user[:first_name],
      last_name: user[:last_name],
      age: user[:age],
      address: "#{user[:street]}, #{user[:city]}, #{user[:state]} #{user[:zip]}",
      email: user[:username],
      password: user[:password],
      country_origin: user[:country_origin]
    )

    puts "You're all set! Here are your options:"
  end

end
