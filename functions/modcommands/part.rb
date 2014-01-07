# Pretty standard stuff here, grab the channel and part from it
def part
  channel = get_message
  send_data("PART #{channel}, just cause")
end
