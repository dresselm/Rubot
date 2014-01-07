def md5
  string = get_message  # Grab the string to be hashed from the user
  hash = Digest::MD5.hexdigest(string)  # Hash the string
  chan_send("#{hash}")  # Send the hash
end
