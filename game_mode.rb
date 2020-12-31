# frozen_string_literal: true

# Decides number of players and turn order
class GameMode
  def initialize
    puts 'How many humans would like to play this game? One or Two?'
    x = gets.chomp.downcase
    x = 'one' if x == '1'
    x = 'two' if x == '2'
    case x
    when 'one'
      @users = x
      turn_order
    when 'two'
      @users = x
      turn_order
    else
      puts "I'm sorry. That's an invalid entry. Please try again."
      initialize
    end
  end

  def turn_order
    if @users == 'one'
      @name_two = 'Ruby'
      puts "If you'd like to go first as the 'Codebreaker' enter 1 now."
      puts "If you'd like to go first as the 'Codemaker' enter 2 now."
      x = gets.to_i
      case x
      when 1
        # mode one is NPC CODEMAKER v PC BREAKER
        puts 'Enter your name, agent.'
        @name_one = gets.chomp
        @mode = 0
      when 2
        # mode two is PC MAKER v NPC BREAKER
        puts 'Enter your name, agent.'
        @name_one = gets.chomp
        @mode = 1
      else
        puts "I'm sorry. That's an invalid entry. Please try again."
        turn_order

      end
    end
    return unless @users == 'two'

    # mode three is PC MAKER v PC BREAKER. Player one is always the codemaker
    @mode = 2
    puts 'Player One: Enter your name'
    @name_one = gets.chomp
    puts 'Player Two: Enter your name'
    @name_two = gets.chomp
  end

  attr_reader :mode, :name_one, :name_two
end
