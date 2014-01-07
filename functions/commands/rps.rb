def rps
  choice = get_message      # Grab the users choice
  comp_choice = rand(1..3)  # Give the computer a random choice of 1-3
  
  if comp_choice == 3 then comp_choice = "rock"     # If the computer choice is 3, it's rock
  elsif comp_choice == 2 then comp_choice = "paper" # If the computer choice is 2, it's paper
  else comp_choice = "scissors"                     # If the computer choice is 1, it's scissors
  end
  
  if choice == "rock" # If the player chose rock
    if comp_choice == "rock" then chan_send("The match is a draw!") # If the bot has rock as well, it's a draw
    elsif comp_choice == "scissors" then chan_send("Your rock smashed scissors, you win!")  # If the computer choice is scissors, the player wins
    else chan_send("Your rock was smothered by paper, you lose!") # Otherwise, the bot wins
    end
    
  elsif choice == "paper" # If the player chose paper
    if comp_choice == "paper" then chan_send("The match is a draw!")  # If the bot has paper as well, it's a draw
    elsif comp_choice == "rock" then chan_send("Your paper smothered the rock, you win!") # If the computer choice is rock, the player wins
    else chan_send("Your paper was cut to pieces, you lose!") # Otherwise, the bot wins
    end
    
  elsif choice == "scissors" # If the player chose scissors
    if comp_choice == "scissors" then chan_send("The match is a draw!") # If the bot has scissors as well, it's a draw
    elsif comp_choice == "paper" then chan_send("Your shreded the paper with your scissors, you win!") # If te computer choice is paper, the player wins
    else chan_send("Your scissors were smashed by a giant rock, you lose!") # Otherwise, the bot wins
    end
    
  else  # If the player did not choose: rock, paper, or scissors
    chan_send("Invalid choice, please use one of the following: rock, paper, or scissors")  # Issue invalid choice
  end
end
