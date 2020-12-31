# frozen_string_literal: true

# prints a legend of color options
module DisplayColors
  def display_colors
    puts ' ________________'
    puts '|                |'
    puts "| 1 - \e[41m   RED   \e[0m  |"
    puts "| 2 - \e[42m  GREEN  \e[0m  |"
    puts "| 3 - \e[44m  BLUE   \e[0m  |"
    puts "| 4 - \e[46m  CYAN   \e[0m  |"
    puts "| 5 - \e[103m YELLOW  \e[0m  |"
    puts "| 6 - \e[45m MAGENTA \e[0m  |"
    puts '|________________|'
  end
end
