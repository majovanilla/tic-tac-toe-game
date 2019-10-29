# frozen_string_literal: true

# !/usr/bin/env ruby

load '../lib/game_logic.rb'

tic_tac = Game.new

puts "Game Start!\n"

puts "Input player 1 name:\n"
player1 = gets.chomp.capitalize
p1 = tic_tac.create_player(player1)

puts "Input player 2 name:\n"
player2 = gets.chomp.capitalize
p2 = tic_tac.create_player(player2)

puts "Tic-tac-toe is a very fun game!\n#{player1} gets the 'X' and #{player2} the 'O'\nThe first one to connect three X's O's sequence is the Winner!\n"

puts "Here's your Tic-tac-toe game board!\n"

puts tic_tac.display_board

turns = 1

while turns <= 9
  current_player = tic_tac.current_player(turns)

  puts "#{current_player.name} it's your turn! Choose a house!"
  current_choice = gets.chomp.downcase
  current_choice = current_choice.to_sym

  if tic_tac.quit_game?(current_choice)
    puts 'Quitting game'
    break
  end

  if tic_tac.choice_checker(current_choice) == 'INVALID CHOICE'
    puts ' Please enter a valid input.'
    puts "\n HINT: combine the letters a,b,c with the numbers 1,2,3 like 'a2'"
    redo
  elsif tic_tac.choice_checker(current_choice) == 'INVALID HOUSE'
    puts ' Please select an empty house'
    redo
  end

  tic_tac.update_board(current_choice, current_player)

  puts tic_tac.display_board

  turns += 1

  next unless turns > 5

  values = tic_tac.board_values

  if tic_tac.winner(values, "O")
    puts "#{player1} wins!"
    break
  elsif tic_tac.winner(values, "O")
    puts "#{player1} wins!"
    break
  elsif tic_tac.winner(values, "X")
    puts "#{player2} wins!"
    break
  elsif tic_tac.winner(values, "X")
    puts "#{player2} wins!"
    break
  elsif tic_tac.tie(values)
		puts "It's a tie!"
  end
end

puts 'End of game'
