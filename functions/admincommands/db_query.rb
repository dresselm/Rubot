def db_query
  que = get_message
  results = @con.query(que)
  results.each {|x| chan_send(x)}
end