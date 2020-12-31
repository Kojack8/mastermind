# frozen_string_literal: true

# creates an array containing all 1296 possible answers for any game of Mastermind
module Generator
  def inc_zero(guess)
    i = 0
    guess.map do |n|
      if i.zero?
        n += 1
        n = 1 if n == 7
      end
      i += 1
      n
    end
  end

  def inc_one(guess)
    i = 0
    guess.map do |n|
      if i == 1
        n += 1
        n = 1 if n == 7
      end
      i += 1
      n
    end
  end

  def inc_two(guess)
    i = 0
    guess.map do |n|
      if i == 2
        n += 1
        n = 1 if n == 7
      end
      i += 1
      n
    end
  end

  def inc_three(guess)
    i = 0
    guess.map do |n|
      if i == 3
        n += 1
        n = 1 if n == 7
      end
      i += 1
      n
    end
  end
end
