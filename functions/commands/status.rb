# This function is for tests, of course -- Keep inside admin area
def status
  counter = 0
  user = @full_user
  if user == @admin
    chan_send("#{@user_name_first}, you are the admistrator!")
  else
    @mods.each do |mod|
      if user == mod
        counter += 1
      end
    end
    if counter > 0
      chan_send("#{@user_name_first}, you are a moderator!")
    else
      chan_send("#{@user_name_first}, you are a regular user!")
    end
  end
end
