def braille
  @braille = {
    'a' => '.', 'b' => '.,.', 'c' => '..',
    'd' => '..,.', 'e' => '., .', 'f' => '..,.',
    'g' => '..,..', 'h' => '. ,..', 'i' => ' .,.',
    'j' => ' .,..', 'k' => '.,,.', 'l' => '.,.,.',
    'm' => '..,,.', 'n' => '.., .,.', 'o' => '., .,.',
    'p' => '..,.,.', 'q' => '..,..,.', 'r' => '.,..,.',
    's' => ' .,.,.', 't' => ' .,..,.', 'u' => '.,,..',
    'v' => '.,.,..', 'w' => ' .,.., .', 'x' => '..,,..',
    'y' => '.., .,..', 'z' => '., .,..', '?' => '.,..',
    '.' => ',.., .', ',' => ',.', '!' => ',..,.',
    '-' => ',..', ' ' => ' ',
    }
    
	option = @input[4]
	if option == '-e'
		brailled = ''
  	data = get_message_from(5).to_lower
  	letters = data.split('')
  	letters.each do |c|
    	@braille.each do |eng, bra|
      	if c == eng
      	  brailled += "#{bra}-"
      	end
    	end
  	end
  	chan_send("#{brailled}")
    chan_send("This command is currently down, sorry.")
	elsif option == '-d'
	  regular = ''
  	string = get_message_from(5).to_lower
  	data = string.split('-')
  	data.each do |c|
    	@braille.each do |eng, bra|
    	  if c == bra
    	    regular += "#{eng}"
    	  end
  		end
  	end
  	chan_send("#{regular}")
	else
		chan_send("ERROR: Invalid option, use: -e or -d")
	end
end
