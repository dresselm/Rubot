def get_message
  text, message = @input.drop(4), '' # Grab all data following a command
  text.map{|word| message += "#{word} "}

  output = File.new('defined_words.yml', 'r')
  @defined_words = YAML.load(output.read)
  output.close
  text.each do |check_word| # Each word from the user

    @defined_words.each do |word, defi| # The words and definitions
      #new_word = word #"%"+word               # Add % to the word to check
      if word == check_word
        message = message.gsub("#{check_word}", "#{defi}")
      end
    end

  end
  message = message.strip!  # Remove the trailing whitespace
  return message            # Return the variable
end
