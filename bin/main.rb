# frozen_string_literal: true

# !/usr/bin/env ruby

houses = { a1: "\s", a2: "\s", a3: "\s", b1: "\s", b2: "\s", b3: "\s", c1: "\s", c2: "\s", c3: "\s" }

puts "Game Start!\n"

puts "Input player 1 name:\n"
player1 = gets.chomp.capitalize
puts "Input player 2 name:\n"
player2 = gets.chomp.capitalize

puts "Tic-tac-toe is a very fun game!\n#{player1} gets the 'X' and #{player2} the 'O'\nThe first one to connect three X's O's sequence is the Winner!\n"

puts "Here's your Tic-tac-toe game board!\n"

puts "    1  2  3\n a [#{houses[:a1]}][#{houses[:a2]}][#{houses[:a3]}]\n b [#{houses[:b1]}][#{houses[:b2]}][#{houses[:b3]}]\n c [#{houses[:c1]}][#{houses[:c2]}][#{houses[:c3]}]\n"

turns = 1

while turns <= 9
  if turns.odd?
    puts "#{player1} it's your turn! Choose a house!"
    player1_choice = gets.chomp.downcase
    if player1_choice == 'quit'
      puts 'Quitting game'
      break
    end
    player1_choice = player1_choice.to_sym
    if houses[player1_choice].nil?
      puts ' Please enter a valid input.'
      puts "\n HINT: combine the letters a,b,c with the numbers 1,2,3 like 'a2'"
      redo
    end
    if houses[player1_choice].match(/[OX]/)
      puts ' Please select an empty house'
      redo
    end
    houses[player1_choice] = 'O'
  else
    puts "#{player2} it's your turn! Choose a house!"
    player2_choice = gets.chomp.downcase
    if player2_choice == 'quit'
      puts 'Quitting game'
      break
    end
    player2_choice = player2_choice.to_sym
    if houses[player2_choice].nil?
      puts ' Please enter a valid input.'
      puts "\n HINT: combine the letters a,b,c with the numbers 1,2,3 like 'a2'"
      redo
    end
    if houses[player2_choice].match(/[OX]/)
      puts ' Please select an empty house'
      redo
    end
    houses[player2_choice] = 'X'
  end
  puts "    1  2  3\n a [#{houses[:a1]}][#{houses[:a2]}][#{houses[:a3]}]\n b [#{houses[:b1]}][#{houses[:b2]}][#{houses[:b3]}]\n c [#{houses[:c1]}][#{houses[:c2]}][#{houses[:c3]}]\n"
  turns += 1

  # Check for victory after the 5th loop
  if turns > 5
    puts "turns > 5"
# [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]
#  0   1   2   3   4   5   6   7   8 
# houses.values
    values = houses.values
    #row conditions
    if values[0..2].join() == 'OOO'
      puts "#{player1} wins on the first row!"
      break
    end
    if values[0..2].join() == "XXX"
      puts "#{player2} wins on the first row!"
      break
    end
    if values[3..5].join() == "OOO"
      puts "#{player1} wins on the second row!"
      break
    end
    if values[3..5].join() == "XXX"
      puts "#{player2} wins on the second row!"
      break
    end
    if values[6..8].join() == "OOO"
      puts "#{player1} wins on the third row!"
      break
    end
    if values[6..8].join() == "XXX"
      puts "#{player2} wins on the third row!"
      break
    end
  end
end

puts "End of game"

