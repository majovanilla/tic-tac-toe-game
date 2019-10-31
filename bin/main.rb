# frozen_string_literal: true

require_relative('../lib/game_logic.rb')

board = Board.new
tic_tac = Game.new(board)

def get_player_name(game, player_num)
  if player_num == 1
    puts 'Input player 1 name:'
  else player_num == 2
    puts 'Input player 2 name:'
  end
  player = gets.chomp.capitalize
  return game.create_player(player)
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

puts "\n\nGame Start!\n\n"

p1 = get_player_name(tic_tac, 1)

p2 = get_player_name(tic_tac, 2)

display_instructions(p1, p2)

puts board.display_board

while tic_tac.game_loop_on
  current_player = tic_tac.current_player(tic_tac.turn_counter)

  puts "#{current_player.name} it's your turn! Choose a cell!"
  current_choice = gets.chomp.downcase
  current_choice = current_choice.to_sym

  if tic_tac.quit_game?(current_choice)
    puts 'Quitting game'
    break
  end

  if board.choice_checker(current_choice) == 'INVALID CHOICE'
    puts ' Please enter a valid input.'
    puts "\n HINT: combine the letters a,b,c with the numbers 1,2,3 like 'a2'"
    redo
  elsif board.choice_checker(current_choice) == 'INVALID CELL'
    puts ' Please select an empty cell'
    redo
  end

  board.update_board(current_choice, current_player)

  puts board.display_board

  # turns += 1
  tic_tac.turn_incrementor

  next unless tic_tac.turn_counter > 5

  values = board.board_values

  if tic_tac.winner(values) == 'P1'
    puts "#{p1.name} wins!"
    break
  elsif tic_tac.winner(values) == 'P2'
    puts "#{p1.name} wins!"
    break
  elsif tic_tac.winner(values) == 'TIE'
    puts "It's a tie!"
  end
end

puts 'End of game'

