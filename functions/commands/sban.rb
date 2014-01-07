# sban searchers if regular expression is in the ban file
def sban
  user = get_message  # Grab the user
  found = 0           # Set an initializer
  
  # For every line in the ban file
  File.readlines('./banned.txt').each do |line|
    line.strip! # Remove the trailing whitespace
    if line == user then found += 1 end # If the user is in the file, add 1 to the initializer
  end
  if found > 0 then chan_send("The regexp was found!")  # If the initializer is > 0, the regex is found
  else chan_send("The regexp was not found!")           # Otherwise, the regexp is not in the file
  end
end
