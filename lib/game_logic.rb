# frozen_string_literal: true

class Game
  @@game_counter = 0
  TURNS = 9
  def initialize
    @board = { a1: "\s", a2: "\s", a3: "\s", b1: "\s", b2: "\s", b3: "\s", c1: "\s", c2: "\s", c3: "\s" }
    @turn_counter = 1
    @current_player = []
    @@game_counter += 1
  end

  def create_player(name)
    player = Player.new(name)
    @current_player << player
  end

  def display_board
    "    1  2  3\n a [#{@board[:a1]}][#{@board[:a2]}][#{@board[:a3]}]\n b [#{@board[:b1]}][#{@board[:b2]}][#{@board[:b3]}]\n c [#{@board[:c1]}][#{@board[:c2]}][#{@board[:c3]}]\n"
  end

  def start_game
    while @turn_counter < TURNS
      puts '???????'
      @turn_counter += 1
    end
  end

  def current_player(turn)
    if turn.odd?
      @current_player[1]
    else
      @current_player[0]
    end
  end

  def board_values
    @board.values.join
  end

  def choice_checker(input)
    return 'INVALID CHOICE' unless choice_valid?(input)

    return 'INVALID HOUSE' unless house_empty?(input)

    return true if choice_valid?(input) && house_empty?(input)
  end

  def choice_valid?(input)
    !@board[input].nil?
  end

  def house_empty?(input)
    return false if @board[input].match(/[OX]/)

    true
  end

  def update_board(input, player)
    puts "\n\n#{player.player_char}\n\n"
    @board[input] = player.player_char
    @board
  end

  def quit_game?(input)
    return true if input == :quit

    false
  end

  def winner(vals, choice)
    return true if row_winner(vals, choice)
    return true if column_winner(vals, choice)
    return true if diagonal_winner(vals, choice)
  end

  def tie(vals)
    return true if vals.match(/\w{9}/)
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
end

class Player
  attr_reader :name
  @@player_number = 0
  def initialize(name)
    @name = name
    @@player_number += 1
    @player_character = @@player_number
  end

  def player_char
    if @player_character.odd?
      'X'
    else
      'O'
    end
  end
end
