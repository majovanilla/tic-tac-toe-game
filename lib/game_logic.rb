#classes:

# Game
# Could include a class variable with games played
# Method / call to class to display the board (instead of puts on line 18)
# Method to instatiate the game / start game method
# Method to create a new player takes as a parameter the player name variable
# Method that includes the loop
# Method for quitting game
# Method check_choice
# Method house_empty?
# Method choice_valid?
# Method update_board
# Method winner
# Optional methods to check rows, columns and diagonals
# Method restart

class Game
  def initialize()
    @board = { a1: "\s", a2: "\s", a3: "\s", b1: "\s", b2: "\s", b3: "\s", c1: "\s", c2: "\s", c3: "\s" }
  end
end

class Player
	@@player_number = 0 
	def initialize(name)
		@name = name
		@player_char = @@pl
		@@player_number += 1
  end
end


# Player(name = player variable)
# @name
# @player_char

#
