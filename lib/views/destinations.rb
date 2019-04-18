require_relative 'modules/banner'
require_relative 'modules/helpers'
class Destination
  include Banner
  include Helper

  def initialize
    @prompt = TTY::Prompt.new
    destinations_banner
    tasks
  end

  def options
    @choice = @prompt.select("These are the options:") do |menu|
      menu.default 1

      menu.choice 'Get destinations by city', 1
      menu.choice 'Read reviews about a destination', 2
      menu.choice 'Get a destination detailed info', 3
      menu.choice 'List all Destinations', 4
      menu.choice 'Go back to the main screen', 5
      menu.choice 'Exit Program', 6
    end
  end

  def tasks
    case options
    when 1
      puts "all destinations by city"
    when 2
      ""
    when 3
      ""
    when 4
      ""
    when 5
      go_back_to_main_screen
    when 6
      system 'clear'
      exit
    end
  end

end
