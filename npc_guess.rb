# frozen_string_literal: true

require_relative 'compare_answer'
require_relative 'check_winner'
require_relative './knuth/knuth_initial'
require_relative './knuth/knuth_comparison'
require_relative 'color_guess'
require_relative 'submit_guess'

# Controls the computer's guess using the Donald Knuth algorithm
class NPCGuess
  include CheckWinner, ColorGuess, SubmitGuess
  def initialize(key)
    @key = key
    @guess_counter = 0
    @winner = false
  end

  def npc_guess
    while @guess_counter < 12 && @winner == false
      puts "This is Agent Ruby's guess ##{@guess_counter + 1}/12."
      sleep(2)
      puts 'Agent Ruby is finalizing their guess.'

      # on the first turn the NPC always guesses 1,1,2,2
      if @guess_counter.zero?
        knuth = KnuthInitial.new
        # generates an array made up for the 1296 answers possible in any game
        # of Mastermind. then duplicates that array
        knu_arr = knuth.generator
        @untried_codes = knu_arr.dup
        @guess_counter += 1
        guess = [1, 1, 2, 2]
      else
        @guess_counter += 1
        # generates a hash made up of the (key) 14 possible comparison returns &
        # (value) a number representing how many times that comparison has
        # occured for this guess
        knuthcomparison = KnuthComparison.new
        @possibilities_arr = knuthcomparison.default_possibilities
        @g_score_arr = []
        # for every @untried_code calculates how many possibilites in knu_arr
        # would be eliminated for each comparison return and saves saves each guess
        # score to the g_score_array
        (0..(@untried_codes.length - 1)).each do |i|
          guess = @untried_codes[i]
          (0..(knu_arr.length - 1)).each do |j|
            hidden_code = knu_arr[j]
            compare = CompareAnswer.new(hidden_code, guess)
            compare = compare.run_comparison
            @possibilities_arr = knuthcomparison.calc_possibilities(compare, @possibilities_arr)
          end
          guess = @possibilities_arr.max_by { |k, v| v }
          @g_score_arr << guess[1]
          @possibilities_arr = knuthcomparison.default_possibilities
        end
        # creates an array of guesses with the smallest g_score as final_choices
        g_min = @g_score_arr.min
        final_choices = []
        counter = 0
        @g_score_arr.each do |i|
          final_choices << @untried_codes[counter] if i == g_min
          counter += 1
        end
        # sorts final choices to ensure the smallest number is picked.
        # checks every potential guess in final_choices to see if it is also in
        # knu_arr. Will guess the first successful match. If no match, guesses
        # the smallest number in final_choices
        final_choices = final_choices.sort_by { |a, b| a }
        final_bool = false
        final_choices.each do |i|
          knu_arr.each do |j|
            next unless i == j

            guess = i
            final_bool = true
            break
          end
        end
        guess = final_choices.first if final_bool == false
      end
      play_guess(guess, knu_arr)
      if check_winner(@key, guess) == true
        @winner = true
        break
      end
    end
    @guess_counter
  end

  def play_guess(guess, knu_arr)
    # plays the guess to get a comparison response.
    compare = CompareAnswer.new(@key, guess)
    comparison = compare.run_comparison
    # removes the guess from both of the arrays
    @untried_codes.slice!(@untried_codes.index(guess))
    # Removes from knu_arr any code that wuld not give the same response
    # if the current guess were the code
    knuthcomparison = KnuthComparison.new
    comparison_arr = knuthcomparison.run_comparison(comparison, guess, knu_arr)
    knu_arr = knuthcomparison.remove_comparisons(knu_arr, comparison_arr)
    # function prints the npcs guess and comparison return
    comparison  = compare.print_comparison(comparison)
    guess = color_guess(guess)
    color_guess(guess)
    submit_guess(guess, comparison)
    knu_arr
  end

  def color_guess(guess)
    answer = []
    guess.each do |x|
      case x
      when 1
        answer << "\e[41m   RED   \e[0m"
      when 2
        answer << "\e[42m  GREEN  \e[0m"
      when 3
        answer << "\e[44m  BLUE   \e[0m"
      when 4
        answer << "\e[46m  CYAN   \e[0m"
      when 5
        answer << "\e[103m YELLOW  \e[0m"
      when 6
        answer << "\e[45m MAGENTA \e[0m"
      end
    end
    answer
  end

  def submit(guess, comparison)
    puts 'Agent Ruby has submitted their guess'
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
