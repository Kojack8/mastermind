module ColorGuess
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
end