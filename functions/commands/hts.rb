def hts
  user = get_message  # Grab the username
  user = user.gsub(/[^a-zA-Z0-9\-_]/, '') # Remove all characters that aren't [a-Z0-9-_]
  
  if user.nil? == true  # If the user did not submit a username
    chan_send("You must enter a username example: !hts -ninjex-")
    
  else  # If the user did submit a username
  
    url = 'http://www.hackthissite.org/api/'+user # Specify the URL
    content = Nokogiri::HTML(open(url)) # Grab the contents of the URL
    p = content.css('p').to_s           # Grab the content inside the <p> css tag
    if p == '<p>User not found</p>'     # If the user is not found
      chan_send("Invalid username!")    # Tell them it's invalid
      
    else  # If the user is found
      stats = p.split("\n") # Split the content into an array seperated by newlines
      final = ''            # Set a value to concatenate all items
      stats.each do |item|  # For every item on in the content
        final += item.gsub('<p>', '').gsub('</p>', '')+" " # Concatenate it to final and remove <p> script tags
      end
    chan_send("#{final}") # Send the data
    end
  end
end
