def len
  string = get_message  # Grab the string from the user
  len = string.length   # Grab the size of the string
  chan_send("The string is: #{len} characters in length!") # Send the information to the user
end
