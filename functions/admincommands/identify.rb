# In case an error happens during identification, this command is here
def identify
  send_data("MODE #{@nick} +B")
  send_data("PRIVMSG NickServ :IDENTIFY #{@pass}")
end
