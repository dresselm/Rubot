# Pretty standard stuff here, just identifying with the server
def login(nick, name)
  send_data("USER #{nick} here.com #{nick} :#{name}")
  send_data("NICK #{nick}")
end
