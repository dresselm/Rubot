def ident
  password = get_message
  if password == @mod_pass
  	@mods.push("#{@full_user}")
  	chan_send("You have been pushed into the mod area!")
  	
  elsif password == @admin_pass
  	@admin = @full_user
   	chan_send("You have been pushed into the administration area!")
  else
    chan_send("Invalid password: #{password}")
  end
end
