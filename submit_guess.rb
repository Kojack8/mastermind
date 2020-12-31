module SubmitGuess
  def submit_guess(guess, comparison)
    puts 'The agent has submitted their guess'
    puts guess.join(" ")
    sleep(3)
    puts "Below are the comparison pegs."
    puts "-Each red peg indicates a guess peg of the right color and the right position."
    puts "-Each white peg indicates a guess peg of the right color but in the wrong position."
    puts "-Each black key peg indicates a color that does not appear in the secret code."
    sleep(2)
    puts comparison.join(" ")
    sleep(3)
  end
end