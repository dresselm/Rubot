# This is a temporary command for programming mission 8
def identify
  send_data("MODE NinjX +B")
  send_data("PRIVMSG NickServ :IDENTIFY #{@pass}")
  sleep(1)
  send_data("PRIVMSG NickServ :set autoop on")
  sleep(1)
  send_data("NOTICE moo :!perm8")
end
