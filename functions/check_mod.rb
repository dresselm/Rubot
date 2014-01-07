def check_mod
  counter = 0 # Initialize a counter to tell if someone is a mod
  @mods.each do |x|     # For each mod in the mods array
    if x == @full_user  # If the user is in the array
      counter += 1      # Add one to our counter
    end
  end
  if counter > 0 then return true # If the counter is > 0, the user is a mod, return true
  else return false end           # Otherwise, the user is not a mod and we return false
end
