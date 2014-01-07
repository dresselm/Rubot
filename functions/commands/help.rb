def help
  u = @user_name_first
#ASCII ART - Font Speed
  a = '______________       _____                ______      ______'    
  b = '___  __ \__  /_________  /_               ___  /_________  /_______'
  c = '__  /_/ /_  __ \  __ \  __/  ________     __  __ \  _ \_  /___  __ \\'
  d = '_  _  _/_  /_/ / /_/ / /_    _/_____/     _  / / /  __/  / __  /_/ /'
  e = '/_/ |_| /_.___/\____/\__/                 /_/ /_/\___//_/  _  .___/'
  f = '                    www.github.com/ninjex/rbot          /_/'

  chan_send("I will send my commands to your pm, #{@user_name_first}")
  send_data("PRIVMSG #{u} :#{a}")
  send_data("PRIVMSG #{u} :#{b}")
  send_data("PRIVMSG #{u} :#{c}")
  send_data("PRIVMSG #{u} :#{d}")
  send_data("PRIVMSG #{u} :#{e}")
  send_data("PRIVMSG #{u} :#{f}")
  send_data("PRIVMSG #{u} :#{@regular_commands[0..-3]}")
  send_data("PRIVMSG #{u} :#{@mod_commands[0..-3]}")
  send_data("PRIVMSG #{u} :#{@admin_commands[0..-3]}")
end
