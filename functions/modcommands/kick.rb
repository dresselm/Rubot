def kick
  user = get_message
  send_data("KICK #{@channel} #{user}")
end
