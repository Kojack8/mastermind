# frozen_string_literal: true

module TakeInput
  def take_input
    key = []
    (0..3).each do |_i|
      x = gets.chomp.to_i
      if x < 1 || x > 6
        puts "I'm sorry, that's an invalid input."
        redo
      else
        case x
        when 1
          puts "\e[41m   RED   \e[0m"
        when 2
          puts "\e[42m  GREEN  \e[0m"
        when 3
          puts "\e[44m  BLUE   \e[0m"
        when 4
          puts "\e[46m  CYAN   \e[0m"
        when 5
          puts "\e[103m YELLOW  \e[0m"
        when 6
          puts "\e[45m MAGENTA \e[0m"
        end
        key.push(x)
      end
    end
    key
  end
end
