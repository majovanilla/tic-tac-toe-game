# frozen_string_literal: true

class Game
  TURNS = 9
  def initialize
    @board = { a1: "\s", a2: "\s", a3: "\s", b1: "\s", b2: "\s", b3: "\s", c1: "\s", c2: "\s", c3: "\s" }
    @turn_counter = 1
    @players = []
  end

  def create_player(name)
    player = Player.new(name)
    @players << player
    player
  end

  def display_board
    "    1  2  3\n a [#{@board[:a1]}][#{@board[:a2]}][#{@board[:a3]}]
 b [#{@board[:b1]}][#{@board[:b2]}][#{@board[:b3]}]
 c [#{@board[:c1]}][#{@board[:c2]}][#{@board[:c3]}]\n"
  end

  def start_game
    while @turn_counter < TURNS
      puts '???????'
      @turn_counter += 1
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

  # rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
  def winner(vals)
    return 'P1' if row_winner(vals, 'O')
    return 'P2' if row_winner(vals, 'X')
    return 'P1' if column_winner(vals, 'O')
    return 'P2' if column_winner(vals, 'X')
    return 'P1' if diagonal_winner(vals, 'O')
    return 'P2' if diagonal_winner(vals, 'X')
    return 'TIE' if check_tie(vals)
  end
  # rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity

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

  def current_player(counter)
    if counter.odd?
      @players[0]
    else
      @players[1]
    end
  end
end

# rubocop:disable Style/ClassVars
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
      'O'
    else
      'X'
    end
  end
end
# rubocop:enable Style/ClassVars
