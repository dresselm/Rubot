# This command will lock down the bot and only allow the admin to use it
def force
  @locked = ''          # Set the variable to lock/unlock
  option = get_message  # Get the user choice
  
  case option
  
  when 'lock'
    @locked = true
    chan_send("Set to lockdown mode.")
    
  when 'unlock'
    @locked = false
    chan_send("Exiting lockdown mode.")
    
  when 'reboot'
    send_data("QUIT #{@user_name_first} made me do it...")
    Kernel.exec("ruby bot.rb")
    
  end
end
