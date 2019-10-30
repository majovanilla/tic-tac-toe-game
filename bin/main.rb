#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative('../lib/game_logic.rb')

tic_tac = Game.new

system 'clear'
system 'cls'

puts "\n\n------------------------\n\n\s\s\s\s\s\sGAME START!\n\n------------------------\n\n"
sleep 0.5
puts 'Choose your player name before starting! (Type in and click enter after the prompt)'

player1 = ''
until tic_tac.valid_name?(player1)
  sleep 0.5
  puts "\n\nPlayer 1. Choose a name. Use only letters and numbers:\n\n"
  player1 = gets.chomp.capitalize
end
p1 = tic_tac.create_player(player1)

player2 = ''
until tic_tac.valid_name?(player2)
  puts "\n\nPlayer 2. Choose a name. Use only letters and numbers:\n\n"
  player2 = gets.chomp.capitalize
end
p2 = tic_tac.create_player(player2)

system 'clear'
system 'cls'

puts "\n\nINSTRUCTIONS:\n\n"
sleep 0.5
puts "Tic-tac-toe is a very fun game!\n#{p1.name} gets the 'X' and #{p2.name} the 'O'\n\n"
sleep 0.5
puts "The first one to connect three X's O's sequence is the Winner!\n\n"
sleep 0.5
puts "If you want to quit the game, type 'quit' after you choose names\n\n"
sleep 0.5
puts 'Select a cell by typing the row (letter) followed by the column (number)'
puts "For example: 'a1'\n\n"

puts '------------- Click enter to start -------------'
gets

system 'clear'
system 'cls'

puts "Here's your Tic-tac-toe game board!\n\n"
sleep 0.5
puts tic_tac.display_board

while tic_tac.game_loop_on
  current_player = tic_tac.current_player(tic_tac.turn_counter)
  sleep 1
  puts "#{current_player.name} it's your turn! Choose a cell!"
  current_choice = gets.chomp.downcase
  current_choice = current_choice.to_sym

  if tic_tac.quit_game?(current_choice)
    sleep 0.5
    puts "\n\n                   ------ QUITTING GAME ------\n\n"
    break
  end

  if tic_tac.choice_checker(current_choice) == 'INVALID CHOICE'
    puts "\n\n Please enter a valid input."
    puts " HINT: combine the letters a,b,c with the numbers 1,2,3 like 'a2'\n\n"
    redo
  elsif tic_tac.choice_checker(current_choice) == 'INVALID CELL'
    puts "\n\n Please select an empty cell\n\n"
    redo
  end

  tic_tac.update_board(current_choice, current_player)

  puts tic_tac.display_board

  # turns += 1
  tic_tac.turn_incrementor

  next unless tic_tac.turn_counter > 5

  values = tic_tac.board_values

  next unless tic_tac.winner(values)

  if tic_tac.winner(values) == 'P1'
    sleep 0.5
    puts "\n\n------------------------\n\n\s\s\s\s\s\s#{p1.name} WINS!\n\n------------------------\n\n"
    tic_tac.update_scores(p1)
  elsif tic_tac.winner(values) == 'P2'
    sleep 0.5
    puts "\n\n------------------------\n\n\s\s\s\s\s\s#{p2.name} WINS!\n\n------------------------\n\n"
    tic_tac.update_scores(p2)
  elsif tic_tac.winner(values) == 'TIE'
    sleep 0.5
    puts "\n\n------------------------\n\n\s\s\s\s\s\sTHAT'S A TIE!\n\n------------------------\n\n"
    tic_tac.update_scores
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
  puts tic_tac.display_board
end
sleep 0.5
puts "\n\n========================================================================
\n                    ------------------------
\n                        END OF THE GAME!
\n                    ------------------------
\n========================================================================\n\n"
