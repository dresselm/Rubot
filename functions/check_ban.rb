def check_ban
  banned = 0  # Initialize a counter to tell if someone is banned
  
  # For each line in the banned file
  File.readlines('./files/banned.txt').each do |line|
    line.strip!   # Remove the trailing whitespace from the line
    if line != '' # If the line is not a null line (\r\n)
      if /#{line}/.match(@full_user) then banned += 1 end  # If the line matches the user add 1 to our counter
    end
  end
  
  if banned > 0 then return true  # If our counter is greater than 0, the user is banned and we return true
  else return false end           # Otherwise, we return false, since the user is not banned
end
