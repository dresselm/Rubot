# Pretty standard stuff here, grab the channel name and join it
def join
  channel = get_message
  send_data("JOIN #{channel}")
end
