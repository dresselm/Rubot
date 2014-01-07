def say
  text = get_message   # Grab the text to send
  chan_send("#{text}") # Send the text
end
