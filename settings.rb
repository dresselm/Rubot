def bot_list_choice
  bot_list = Dir["./bots/*.rb"] # Directory list containing configured bots
  bot_list.each_with_index.map{|x,y| x = x.to_s.gsub('./bots/', '')[0..-4]; puts "#{y} => #{x}"} # Display all the bots
  puts "E => Exit"
  puts "M => Menu"
  print 'Choice => '
  user_choice = gets.chomp
  if user_choice == 'e' or user_choice == 'E'
    abort('Terminating...')
  elsif user_choice == 'm' or user_choice == 'M'
    puts '' # New line for sexy
    exec("ruby bot.rb") # Restart the program to prevent issues with unfinished menu selections
  elsif user_choice =~ /[^0-9]/ # If the user doesn't enter a number
    abort('Invalid choice given, terminating...')
  else
    return bot_list[user_choice.to_i]
  end
end

def menu # We place this information in a function to recursively call it inside sub-menus
  choice = ''
  puts "MAIN MENU"
  puts "0. Quick Start - Use the default configured bot."
  puts "1. Choose Bot - Select a previously configured bot."
  puts "2. Create a new bot."
  puts "3. Change the default bot."
  puts "4. Change a configured bot."
  puts "5. Delete a configured bot."
  puts "6. Make a temporary bot to use."
  puts "7. Show all configured bots."
  puts "Q. Terminate the program."
  print '> '
  choice = gets.chomp
  puts ''
  case choice
    when '0' # Quick start (use default bot)
      puts "QUICK START"
      puts "Loading the default bot configuration."; puts ''
      require './bots/default.rb'
    when '1' # Choose a configured bot to use
      puts "BOT SELECTION"
      bot_choice = bot_list_choice
      pretty_bot_choice = bot_choice.gsub(/.\/bots\//,'')[0..-3]
      puts "You have chosen to load #{pretty_bot_choice}"; puts ''
      require bot_choice
    when '2' # Create a bot
      puts "WELCOME TO THE BOT CREATION MENU"
      print 'Botname => '
      default_bot = gets.chomp
      print 'Realname => '
      default_realname = gets.chomp
      print 'Server => '
      default_server = gets.chomp
      print 'Port => '
      default_port = gets.chomp
      print 'Channel => '
      default_channel = gets.chomp
      print 'Save File => '
      default_save = gets.chomp + ".rb"
      write_bot = <<-breaker
@server = '#{default_server}'
@port = #{default_port}
@nick = '#{default_bot}'
@name = '#{default_realname}'
@chan = '#{default_channel}'
breaker
      File.open("./bots/#{default_save}", 'w') {|f| f.write(write_bot.strip)} # Write bot configuration to specified location
      puts "Successfully created your bot #{default_bot} in /bots/#{default_save}"; puts ''
      menu
    when '3' # Change the default bot
      puts "CHANGE THE DEFAULT BOT"
      default_choice = bot_list_choice
      puts "Overwritting the default configuration with: #{default_choice}"
      `cat #{default_choice} > ./bots/default.rb` # Overwrite the default bot with the user specified bot
      puts "Overwrite finished."; puts ''
      menu
    when '4' # Edit a bot
      puts "CHOOSE A BOT TO EDIT"
      bot_file = bot_list_choice
      `subl #{bot_file}`; puts '' # Open sublime and edit text (probably need to change code to install sublime if it isn't)
      menu
    when '5' # Delete a bot
      puts "CHOOSE A BOT TO DELETE"
      bot_file = bot_list_choice
      puts "Deleting contents of #{bot_file}"; puts ''
      `rm #{bot_file}` # Remove the specified bot
      menu
    when '6' # Create a one time bot to use
      puts "TEMPORARY BOT"
      print "Botname => ";      @nick = gets.chomp
      print "Realname => ";     @name = gets.chomp
      print "Server => ";       @server = gets.chomp
      print "Port => ";         @port = gets.chomp
      print "Channel => ";      @chan = gets.chomp
      puts "Attempting to make a connection..."
    when '7' # Show configured bots
      puts "BOT LIST"
      bot_list = Dir["./bots/*.rb"]
      bot_list.each_with_index.map{|x,y| x = x.to_s.gsub('./bots/', '')[0..-4]; puts "#{y} => #{x}"}; puts ''
      menu
    when 'q'
      abort('Terminating...')
    when 'Q'
      abort('Terminating...')
  end
end
menu