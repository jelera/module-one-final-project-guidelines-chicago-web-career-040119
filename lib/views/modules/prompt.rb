module Prompt
  def user_prompt
   print "> " 
  end

  def start_prompt
    puts "Welcome, Children!".upcase
    puts ""
    puts "To #{@company_name}"
    puts ""
    puts ""
    puts "Please enter your username:"
    user_prompt
  end

  def command_prompt(options_h)
    puts "-------------------"
    puts "How may I help you?".upcase
    puts "-------------------"
    puts ""
    puts "Here is what I can do"
    puts ""
    puts parse_options(options_h)
    puts ""
    puts ""
    puts "Press a key to continue"
    puts "Press [Q] to exit"
  end
end
