# frozen_string_literal: true

# Compares guess and key to check for a correct answer for the round
module CheckWinner
  def check_winner(key, answer)
    return unless key == answer

    puts 'That is the correct code. Well done.'
    true
  end
end
