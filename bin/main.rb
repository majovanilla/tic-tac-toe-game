#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative('../lib/game_logic.rb')

board = Board.new
tic_tac = Game.new(board)

def get_player_name(game, player_num)
  if player_num == 1
    puts 'Input player 1 name:'
  elsif player_num == 2
    puts 'Input player 2 name:'
  end
  player = gets.chomp.capitalize
  game.create_player(player)
end

def display_instructions(player1, player2) 
  puts "INSTRUCTIONS:\n\n"
  puts "Tic-tac-toe is a very fun game!\n#{player1.name} gets the 'X' and #{player2.name} the 'O'\n\n"
  puts "The first one to connect three X's O's sequence is the Winner!\n\n"
  puts "If you want to quit the game, type 'quit' after you choose names\n\n"
  puts 'Select a cell by typing the row (letter) followed by the column (number)'
  puts "For example: 'a1'\n\n"
  puts "Here's your Tic-tac-toe game board!\n\n"
end

def invalid_choice?(current_choice, board)
  input = board.choice_checker(current_choice) 
  return false if input.class == TrueClass

  if input == 'INVALID CHOICE'
    puts "\n\n Please enter a valid input."
    puts "\n HINT: combine the letters a,b,c with the numbers 1,2,3 like 'a2'"      
  elsif input == 'INVALID CELL'
    puts "\n\n Please select an empty cell"
  end
  true
end

def get_player_choice(player)
  puts "#{player.name} it's your turn! Choose a cell!"
  current_choice = gets.chomp.downcase
  current_choice.to_sym
end

def turn_result(result)
  return false if result.empty?

  puts "#{result} wins!"
  true
end

puts "\n\nGame Start!\n\n"

p1 = get_player_name(tic_tac, 1)

p2 = get_player_name(tic_tac, 2)

display_instructions(p1, p2)

puts board.display_board

while tic_tac.game_loop_on
  current_player = tic_tac.current_player(tic_tac.turn_counter)
  current_choice = get_player_choice(current_player)

  break puts 'Quitting game' if tic_tac.quit_game?(current_choice)

  redo if invalid_choice?(current_choice, board)

  board.update_board(current_choice, current_player)

  puts board.display_board

  tic_tac.turn_incrementor

  next unless tic_tac.turn_counter > 5

  values = board.board_values

  result_final = "#{tic_tac.winner(values, 0)}#{tic_tac.winner(values, 1)}"

  return puts "It's a tie!" if result_final == 'TIETIE'

  break if turn_result(result_final)
end

puts 'End of game'
