def get_message_from(int) # Int is where we will grab input from the array
  int.to_i      # Convert int to an integer
  message = ''  # Set an initializer where we will concatenate our array values
  
  text = @input.drop(int) # Grab data from the array after the desired int
  text.each do |wrd|      # For each piece of data
    message += wrd+" "    # Concatenate the data to our initializer
  end
  
  message = message.strip!  # Remove whitespace
  return message            # Return the variable
end
