# This function will grab the latest post on the forums and give details about it.
def forums
  url     = 'https://www.hackthissite.org/forums/search.php?search_id=active_topics'  # Setting the URL to the Forums
  content = Nokogiri::HTML(open(url)) # Grab the content of the url
  
  topic_title = content.css('a.topictitle') # Grab the content inside of '<a href' tag containing class 'topictitle'
  last_post   = content.css('span > a')     # Grab the content inside the class 'span' contain '<a' script tag
  total_posts = content.css('dd.posts')     # Grab the content inside the class 'dd' that contains 'post'
  total_views = content.css('dd.views')     # Grab the content inside the class 'dd' that contains 'views'
    
  topic_url   = content.css('span > a[href]').to_s  # <a href="./viewtopic.php?f=33&amp;t=10201&amp;sid=caefdf549d34d9dbafc8fe4394f8044d&amp;start=0">1
  split_url   = topic_url.split('viewtopic.php?')   # Split the URL starting at 'viewtopic.php?'
  split_url_b = split_url[1].split('&amp;sid=')     # remove everything after the &sid=
  topic_path = split_url_b[0].gsub('amp;', '')      # remove the trailing amp
  url = 'www.hackthissite.org/forums/viewtopic.php?'+topic_path # set the URL
  
  # Set a final variable which contains all the information to send
  # ", Last Post By: "+last_post[6]+ # Keeps changing based on the post needs to be fixed
  final = "Title: "+topic_title[0]+">> Total Posts: "+total_posts[1]+", Views: "+total_views[1]+", URL: "+url.gsub('&p=77022','')
  
  # Send the data
  chan_send("#{final}")
end
