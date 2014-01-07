def test
	message = get_message
	send_data("PRIVMSG #botwar :#{message}")
end
