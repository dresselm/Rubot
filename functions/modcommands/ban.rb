def ban
  user = get_message  # Grab the user to ban
  user.strip!         # Remove the whitespace
  found = 0           # Declare an initializer
  
  # For each line in the ban file
  File.readlines('./files/banned.txt').each do |line|
    line.strip! # Remove the trailing whitespace
    # If a match is found, let the user know and add 1 to the initializer
    if line == user then chan_send('The regexp already exists!'); found += 1 end
  end
  
  if found == 0 # If the initializer is 0
    # Open up the banned file with read write access
    open('./files/banned.txt', 'a') { |f|
    f.puts user # Add the user to the banned file
    chan_send('Successfully banned the given regexp!')  # Let them know it was successful
    }
  end
end
