# frozen_string_literal: true

# !/usr/bin/env ruby

load '../lib/game_logic.rb'

tic_tac = Game.new

houses = { a1: "\s", a2: "\s", a3: "\s", b1: "\s", b2: "\s", b3: "\s", c1: "\s", c2: "\s", c3: "\s" }

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
  if turns.odd?
    puts "#{player1} it's your turn! Choose a house!"
    player1_choice = gets.chomp.downcase
    player1_choice = player1_choice.to_sym

    if tic_tac.quit_game?(player1_choice)
      puts 'Quitting game'
      break
    end

    if tic_tac.choice_checker(player1_choice) == 'INVALID CHOICE'
      puts ' Please enter a valid input.'
      puts "\n HINT: combine the letters a,b,c with the numbers 1,2,3 like 'a2'"
      redo
    elsif tic_tac.choice_checker(player1_choice) == 'INVALID HOUSE'
      puts ' Please select an empty house'
      redo
		end
		
    tic_tac.update_board(player1_choice, p1)
  else
    puts "#{player2} it's your turn! Choose a house!"
    player2_choice = gets.chomp.downcase
    player2_choice = player2_choice.to_sym

    if tic_tac.quit_game?(player2_choice)
      puts 'Quitting game'
      break
    end

    if tic_tac.choice_checker(player2_choice) == 'INVALID CHOICE'
      puts ' Please enter a valid input.'
      puts "\n HINT: combine the letters a,b,c with the numbers 1,2,3 like 'a2'"
      redo
    elsif tic_tac.choice_checker(player2_choice) == 'INVALID HOUSE'
      puts ' Please select an empty house'
      redo
		end
		
    tic_tac.update_board(player2_choice, p2)

	end

	puts tic_tac.display_board

  turns += 1

  next unless turns > 5

  values = tic_tac.board_values

  if tic_tac.winner(values) == 'P1'
    puts "#{player1} wins!"
    break
  elsif tic_tac.winner(values) == 'P2'
    puts "#{player2} wins!"
    break
  end
end

puts 'End of game'
