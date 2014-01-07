# This script will take all ruby files inside /functions, /functions/commands/, /functions/modcommands/, /functions/admincommands/
# Then we will take each file and require it so that we can use those files
# Then we strip the filepath to just it's name and add :! so /functions/modcommands/newnick.rb becomes :!newnick <= older
# We then push the string into a specific array depending on it's location which can be used to match command names in bot.rb
# Look at /functions/check_command.rb to see how we pass these files to the main bot and use them when called
# We will also push the commands to a string based on the privs which we use for a help command

@command_array        = []  # Create an array for regular user commands
@mod_command_array    = []  # Create an array for moderator commands
@admin_command_array  = []  # Create an array for administrator commands
@regular_commands     = 'Regular Commands: '
@mod_commands         = 'Moderator Commands: '
@admin_commands       = 'Administrator Commands: '

# For each ruby file in the regular commands directory
Dir["./functions/commands/*.rb"].each do |file| 
  require file  # Require the file
  # Remove The directory path and .rb from the filepath and store it as a variable
  func = file.gsub('./functions/commands/', '').chop.chop.chop!
  # Push the variable into the regular command array with :! prefixed for the command syntax
  @command_array.push(":("+func+')') # :(say)
  @regular_commands += "(#{func}), "
end

# For each ruby file in the modcommands directory
Dir["./functions/modcommands/*.rb"].each do |file| 
  require file  # Require the file
  # Remove The directory path and .rb from the filepath and store it as a variable
  modfunc = file.gsub('./functions/modcommands/', '').chop.chop.chop!
  # Push the variable into the regular command array with :! prefixed for the command syntax
  @mod_command_array.push(":./"+modfunc)
  @mod_commands += "./#{modfunc}, "
end

# For each ruby file in the admincommands directory
Dir["./functions/admincommands/*.rb"].each do |file| 
  require file  # Require the file
  # Remove The directory path and .rb from the filepath and store it as a variable
  adminfunc = file.gsub('./functions/admincommands/', '').chop.chop.chop!
  # Push the variable into the regular command array with :! prefixed for the command syntax
  @admin_command_array.push(":./"+adminfunc)
  @admin_commands += "./#{adminfunc}, "
end

# For each ruby file in the functions directory
Dir["./functions/*.rb"].each do |file|
  require file  # Require the file
end
