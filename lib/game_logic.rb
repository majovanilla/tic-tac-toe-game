# frozen_string_literal: true

class Game
  attr_reader :turn_counter
  def initialize(board)
    @board = board
    @turn_counter = 1
    @players = []
    @turns = 9
    @games_played = 0
    @win = false
  end

  def turn_incrementor
    @turn_counter += 1
  end

  def game_loop_on?
    @turn_counter <= @turns
  end

  def create_player(name)
    player = Player.new(name)
    @players << player
    player
  end

  def restart_game?(input)
    if input == 'yes'
      @board.board_reseter
      turn_reseter
      @win = false
      true
    elsif input == 'no'
      false
    end
  end

  def quit_game?(input)
    return true if input == :quit

    false
  end

  def display_scores
    [@games_played, @players[0].games_won, @players[1].games_won]
  end

  def winner(vals, player_number)
    if row_winner(vals, @players[player_number].player_char) ||
       column_winner(vals, @players[player_number].player_char) ||
       diagonal_winner(vals, @players[player_number].player_char)
      @win = true
      update_scores(@players[player_number])
      @players[player_number].name
    elsif check_tie(vals) && !@win
      update_scores
      'TIE'
    end
  end

  def current_player(counter)
    if counter.odd?
      @players[0]
    else
      @players[1]
    end
  end

  def update_scores(player = nil)
    @games_played += 1
    player&.player_win
  end

  private

  def turn_reseter
    @turn_counter = 1
  end

  def row_winner(values, choice)
    if values[0..2] == "#{choice}#{choice}#{choice}" ||
       values[3..5] == "#{choice}#{choice}#{choice}" ||
       values[6..8] == "#{choice}#{choice}#{choice}"
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

  def check_tie(vals)
    return true if vals.match(/\w{9}/)
  end

  def valid_name?(input)
    return false unless input.match(/[\w\d]+/)

    true
  end
end

class Board
  def initialize
    @board = { a1: "\s", a2: "\s", a3: "\s", b1: "\s", b2: "\s", b3: "\s", c1: "\s", c2: "\s", c3: "\s" }
  end

  def display_board
    "    1  2  3\n a [#{@board[:a1]}][#{@board[:a2]}][#{@board[:a3]}]
 b [#{@board[:b1]}][#{@board[:b2]}][#{@board[:b3]}]
 c [#{@board[:c1]}][#{@board[:c2]}][#{@board[:c3]}]\n\n"
  end

  def board_values
    @board.values.join
  end

  def choice_checker(input)
    return 'INVALID CHOICE' unless choice_valid?(input)

    return 'INVALID CELL' unless cell_empty?(input)

    return true if choice_valid?(input) && cell_empty?(input)
  end

  def update_board(input, player)
    @board[input] = player.player_char
    @board
  end

  def board_reseter
    @board = { a1: "\s", a2: "\s", a3: "\s", b1: "\s", b2: "\s", b3: "\s", c1: "\s", c2: "\s", c3: "\s" }
  end

  private

  def choice_valid?(input)
    !@board[input].nil?
  end

  def cell_empty?(input)
    return false if @board[input].match(/[OX]/)

    true
  end
end

# rubocop:disable Style/ClassVars
class Player
  attr_reader :name, :games_won
  @@player_number = 0
  def initialize(name)
    @name = name
    @@player_number += 1
    @player_character = @@player_number
    @games_won = 0
  end

  def player_char
    if @player_character.odd?
      :O
    else
      :X
    end
  end

  def player_win
    @games_won += 1
  end
end
# rubocop:enable Style/ClassVars
