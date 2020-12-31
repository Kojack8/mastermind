# frozen_string_literal: true

require_relative 'compare_answer'
require_relative 'check_winner'
require_relative 'take_input'
require_relative 'display_colors'
require_relative 'color_guess'
require_relative 'submit_guess'
# Recieves human guess and compares it to the key
class HumanGuess
  include TakeInput, CheckWinner, DisplayColors, ColorGuess, SubmitGuess
  def initialize(key, player)
    @key = key
    @player = player
    @guess_counter = 0
    @winner = false
  end

  def human_guess
    while @guess_counter < 12 && @winner == false
      @guess_counter += 1
      display_colors
      puts "Guess ##{@guess_counter}/12 for Agent #{@player}. Using the numbers below enter your four guesses" \
      ' one at a time.'
      guess = take_input
      hold_guess = guess.dup
     
      compare = CompareAnswer.new(@key, guess)
      comparison = compare.run_comparison
      
      comparison = compare.print_comparison(comparison)
      guess = color_guess(guess)
      submit_guess(guess, comparison)
      if check_winner(@key, hold_guess) == true
        @winner = true
        break
      end
    end
    # gives a bonus point if you go the whole round without getting any
    @guess_counter += 1 if @guess_counter == 12
    @guess_counter
  end



 
end
