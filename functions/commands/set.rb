def set
  word = @input[4]
  if @input[5] == "="
    text = get_message_from(6)
    @defined_words["#{word}"] = text
    output = File.new('defined_words.yml', 'w') # Set yaml file to push to
    output.puts YAML.dump(@defined_words) # Write Owner to the yaml file
    output.close # Close the yaml file
    chan_send("Defined #{word}: #{text}")
  else
    chan_send("You didn't not place the `=` operand in the correct position.")
  end
end
