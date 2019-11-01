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
  puts "\n\nINSTRUCTIONS:\n\n"
  sleep 0.5
  puts "Tic-tac-toe is a very fun game!\n#{player1.name} gets the 'X' and #{player2.name} the 'O'\n\n"
  sleep 0.5
  puts "The first one to connect three X's O's sequence is the Winner!\n\n"
  sleep 0.5
  puts "If you want to quit the game, type 'quit' after you choose names\n\n"
  sleep 0.5
  puts 'Select a cell by typing the row (letter) followed by the column (number)'
  puts "For example: 'a1'\n\n"
end

def invalid_choice?(current_choice, board)
  input = board.choice_checker(current_choice) 
  return false if input.class == TrueClass

  if input == 'INVALID CHOICE'
    puts "\n\n Please enter a valid input."
    puts " HINT: combine the letters a,b,c with the numbers 1,2,3 like 'a2'\n\n"
  elsif input == 'INVALID CELL'
    puts "\n\n Please select an empty cell\n\n"
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

  puts "\n\n------------------------\n\n\s\s\s\s\s\s#{result} WINS!\n\n------------------------\n\n"
  true
end

system 'clear'
system 'cls'

puts "\n\n------------------------\n\n\s\s\s\s\s\sGAME START!\n\n------------------------\n\n"
sleep 0.5
puts 'Choose your player name before starting! (Type in and click enter after the prompt)'

sleep 0.5
p1 = get_player_name(tic_tac, 1)
sleep 0.5
p2 = get_player_name(tic_tac, 2)

system 'clear'
system 'cls'

sleep 0.5
display_instructions(p1, p2)


puts '------------- Click enter to start -------------'
gets

system 'clear'
system 'cls'

puts "Here's your Tic-tac-toe game board!\n\n"
sleep 0.5
puts board.display_board

while tic_tac.game_loop_on
  current_player = tic_tac.current_player(tic_tac.turn_counter)
  sleep 0.5
  current_choice = get_player_choice(current_player)

  sleep 0.5
  break puts "\n\n                   ------ QUITTING GAME ------\n\n" if tic_tac.quit_game?(current_choice)

  redo if invalid_choice?(current_choice, board)

  board.update_board(current_choice, current_player)

  puts board.display_board

  tic_tac.turn_incrementor

  next unless tic_tac.turn_counter > 5

  values = board.board_values

  sleep 0.5
  result_final = "#{tic_tac.winner(values, 0)}#{tic_tac.winner(values, 1)}"

  if result_final == 'TIETIE'
    tic_tac.update_scores
    puts "\n\n------------------------\n\n\s\s\s\s\s\sTHAT'S A TIE!\n\n------------------------\n\n" 
  elsif !turn_result(result_final)
    next
  end

  scores = tic_tac.display_scores

  sleep 0.5
  puts "You have played #{scores[0]} games.\n\n"
  puts "#{p1.name} has won #{scores[1]} games.\n\n"
  puts "#{p2.name} has won #{scores[2]} games.\n\n"
  puts 'Do you want to restart the game? (yes/no)'
  option = gets.chomp.downcase
  break unless tic_tac.restart_game?(option)

  sleep 0.5
  puts "\n\n\n------------------------\n\n\s\s\s\s\s\sGAME RESTART!\n\n------------------------\n\n"
  sleep 0.5
  puts board.display_board
end

sleep 0.5
puts "\n\n========================================================================
\n                    ------------------------
\n                        END OF THE GAME!
\n                    ------------------------
\n========================================================================\n\n"
