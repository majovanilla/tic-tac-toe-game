# frozen_string_literal: true

# classes:

# Game
# Could include a class variable with games played
# Method / call to class to display the board (instead of puts on line 18)
# Method to instatiate the game / start game method
# Method to create a new player takes as a parameter the player name variable
# Method that includes the loop
# Method for quitting game
# ---???Method check_choice
# Method choice_valid?
# Method house_empty?
# Method update_board
# Method winner
# Optional methods to check rows, columns and diagonals

# Method restart

class Game
  @@game_counter = 0
  def initialize
    @board = { a1: "\s", a2: "\s", a3: "\s", b1: "\s", b2: "\s", b3: "\s", c1: "\s", c2: "\s", c3: "\s" }
    @@game_counter += 1
  end

  def create_player(name)
    Player.new(name)
  end

  def display_board
    @board
  end

  def start_game; end

  def choice_checker(input)
    return 'QUITTING GAME' if quit_game?(input)

    return 'INVALID CHOICE' unless choice_valid?(input)

    return 'INVALID HOUSE' unless house_empty?(input)

    return true if choice_valid?(input) && house_empty?(input)
  end

  def choice_valid?(input)
    !input.nil?
  end

  def house_empty?(input)
    return false if input.match(/[OX]/)

    true
  end

  def update_board(input, player)
    @board[input] = player.player_char
    @board
  end

  def quit_game?(input)
    return true if input == 'quit'

    false
  end

  def winner(vals)
    return 'P1' if row_winner(vals, 'O')
    return 'P2' if row_winner(vals, 'X')
    return 'P1' if column_winner(vals, 'O')
    return 'P2' if column_winner(vals, 'X')
    return 'P1' if diagonal_winner(vals, 'O')
    return 'P2' if diagonal_winner(vals, 'X')
  end

  def row_winner(values, choice)
    if values[0..2] == "#{choice}#{choice}#{choice}" || values[3..5] == "#{choice}#{choice}#{choice}" || values[6..8] == "#{choice}#{choice}#{choice}"
      true
    else
      false
    end
  end

  def column_winner(values, choice)
    return true if values.match(/#{choice}..#{choice}..#{choice}/)
  end

  def diagonal_winner(values, choice)
    true if values.match(/#{choice}...#{choice}...#{choice}/) || values.match(/..#{choice}.#{choice}.#{choice}../)
  end

  def board_values
    @board.values.join
  end
end

class Player
  @@player_number = 0
  def initialize(name)
    @name = name
    @@player_number += 1
  end

  def player_char
    if @@player_number.odd?
      'O'
    else
      'X'
    end
  end
end

# Player(name = player variable)
# @name
# @player_char

my_game = Game.new

sarah = my_game.create_player('Sarah')

# puts my_game.update_board(:a1, sarah)
# puts my_game.update_board(:a3, sarah)
# puts my_game.update_board(:a2, sarah)

board = { a1: 'O', a2: "\s", a3: "\s", b1: "\s", b2: 'O', b3: "\s", c1: "\s", c2: "\s", c3: 'O' }.values.join
puts board
puts my_game.winner(board)
