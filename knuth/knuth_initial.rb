require_relative '../check_winner'
require_relative 'generator'

class KnuthInitial
  include CheckWinner, Generator
  def initialize
    @s = []
    @guess = [1, 1, 1, 1]
  end

  def add_arr
    @s << @guess
  end

  def generator
    add_arr
    # first round
    counter = 0
    while counter < 5
      @guess = inc_three(@guess)
      counter += 1
      add_arr
    end
    # second round
    counter = 0
    while counter < 5
      @guess = inc_two(@guess)
      i = 0
      while i < 6
        @guess = inc_three(@guess)
        i += 1
        add_arr
      end
      counter += 1
    end

    # third round
    counter = 0
    while counter < 5
      @guess = inc_one(@guess)
      j = 0
      while j < 6
        @guess = inc_two(@guess)
        i = 0
        while i < 6
          @guess = inc_three(@guess)
          i += 1
          add_arr
        end
        j += 1
      end
      counter += 1
    end


    # fourth round
    counter = 0
    while counter < 5 
      @guess = inc_zero(@guess)
      k = 0
      while k < 6
        @guess = inc_one(@guess)
        j = 0
        while j < 6
          @guess = inc_two(@guess)
          i = 0
          while i < 6
            @guess = inc_three(@guess)
            i += 1
            add_arr
          end
          j += 1
        end
        k += 1
      end
      counter += 1
    end
    @s
  end



  attr_reader :s
end




