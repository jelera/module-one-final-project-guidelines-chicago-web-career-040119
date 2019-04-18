module Helper
  def parse_options(options_h)
    output = "" 
    options_h.each do |key, label|
      output = output + "[#{key.to_s.upcase}] => #{label}" + "\n"
    end
    output
  end

  def validate_input(input, options_h)
    if input == "Q"
      puts "Good Bye"
      exit
    else
      options_h.keys.include?(input) 
    end
  end

  def go_back_to_main_screen
    $main_screen.welcome_screen
    $main_screen.main_menu
  end
end
