# !/usr/bin/env ruby

houses = { "a1": "\s", "a2": "\s", "a3": "\s", "b1": "\s", "b2": "\s", "b3": "\s", "c1": "\s", "c2": "\s", "c3": "\s"}
a1 = "_"

puts "Game Start!\n"

puts "Input player 1 name:\n"
player1 = gets.chomp
puts "Input player 1 name:\n"
player2 = gets.chomp

puts "Tic-tac-toe is a very fun game!\n#{player1} gets the 'X' and #{player2} the 'O'\nThe first one to connect three X's O's sequence is the Winner!\n"

puts "Here's your Tic-tac-toe game board!\n"

puts "    1  2  3\n a [#{houses["a1"]}][#{houses["a2"]}][#{houses["a3"]}]\n b [#{houses["b1"]}][#{houses["b2"]}][#{houses["b3"]}]\n c [#{houses["c1"]}][#{houses["c2"]}][#{houses["c3"]}]\n"

puts "Choose a house from the board (choose a letter and a number according to the board above)"

puts "#{player1} it's your turn!"
player1_choice = gets.chomp