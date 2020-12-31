# frozen_string_literal: true

require_relative 'take_input'
require_relative 'display_colors'

# Takes a key from a player or generates a key for an NPC
class NewKey
  include TakeInput
  include DisplayColors
  def initialize(player)
    @player = player
  end

  def choose_key_pc
    puts "Good afternoon, Agent #{@player}. Welcome to Mastermind."
    sleep(2)
    puts 'In a moment, I will ask you to input four colors in order. Simply type ' \
    'in your selection one at a time, hitting enter after each input.'
    sleep(2)
    puts 'Choose four pegs from the following list of colors. You may repeat a color' \
      ' ad nauseam.'
    display_colors
    puts 'Make your selections now.'
    take_input
  end

  def choose_key_npc
    colors = [1, 2, 3, 4, 5, 6]
    key = []
    (0..3).each do |_i|
      key.push(colors[rand(6)])
    end
    puts 'The Codemaker has locked in their code.'
    key
  end
end
