# Pretty standard stuff here, just quit then abort the program
def exit
  send_data("QUIT #{@user_name_first} made me do it...")
  abort("Recieved an exit command from #{@full_user}!")
end
