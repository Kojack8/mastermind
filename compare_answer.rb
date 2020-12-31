# frozen_string_literal: true

# Compares a guess to the key and returns an comparison array
# There are some time complexity problems on this page but correcting them is
# outside the scope of this project
class CompareAnswer
  def initialize(key, answer)
    @comparison = []
    @successful_colors = []
    @key = key
    @answer = answer
    # creates 2 arrays. one which will contain the feedback peg colors and another
    # which will help validate 'correct color and incorrect placement' choices
    (0..3).each do |i|
      if answer[i] == key[i]
        @comparison.push(2)
        @successful_colors.push(answer[i])
      else
        @successful_colors.push(nil)
        @comparison.push(nil)
      end
    end
  end

  def run_comparison
    # returns an array of bools expessions where in true reps. correct_color with
    # incorrect location
    correct_colors = check_color
    # @comparison array gets mapped to change nil values to either 1 or 0
    supercounter = -1
    @comparison.map! do |x|
      supercounter += 1
      if x.nil?
        if correct_colors[supercounter] == true
          1
        else
          0
        end
      else
        x
      end
    end
    # returns completed array to parent function self.METHOD_turn
    # array should now contain 4 values each between 0-2
    # 2 = RED PEG - Correct color and location
    # 1 = WHITE PEG - Correct color; incorrect location
    # 0 = NO PEG - Wrong color and location
    # reorders 2 -> 1 -> 0
    @comparison = @comparison.sort { |a, b| b <=> a }
  end

  def check_color
    temp_key = []
    temp_answer = []
    i = 0
    while i < 4
      temp_key.push(@key[i])
      temp_answer.push(@answer[i])
      i += 1
    end

    i = -1
    temp_key.map! do |x|
      i += 1
      if temp_key[i] == temp_answer[i]
        nil
      else
        x
      end
    end

    i = -1
    temp_answer.map! do |x|
      i += 1
      if temp_key[i].nil?
        -1
      else
        x
      end
    end

    final = []
    counter = 0
    while counter < 4
      if temp_key.include? temp_answer[counter]
        final.push(true)
        limit_once = false
        temp_key.map! do |x|
          if limit_once == false
            if x == temp_answer[counter]
              limit_once = true
              nil
            else
              x
            end
          else
            x
          end
        end
      else
        final.push(false)
      end
      counter += 1
    end
    final
  end

  def print_comparison(comparison)
    answer = []
    comparison.each do |x|
      if x == 2
        answer << "\e[41m    \e[0m"
      end
      if x == 1
        answer << "\e[47m    \e[0m"
      end
      if x == 0
        answer << "\e[40m    \e[0m"
      end
    end
    answer
  end
end
