# spec/game_logic_rspec.rb

# frozen_string_literal: true

require './lib/game_logic.rb'
vals_row1_winner_x = "XXX\sOO\sO\s"
vals_row2_winner_x = "OO\sXXX\s\sO"
vals_row3_winner_x = "O\sOO\s\sXXX"
vals_row1_winner_o = "OOO\s\sX\s\sX"
vals_row2_winner_o = "X\s\sOOO\s\sX"
vals_row3_winner_o = "\sXX\s\s\sOOO"
vals_col1_winner_x = "X\s\sXOOXO\s"
vals_col2_winner_x = "\sX\s\sXOOXO"
vals_col3_winner_x = "\s\sXO\sXOOX"
vals_col1_winner_o = "O\s\sOXXO\s\s"
vals_col2_winner_o = "\sO\s\sOXXO\s"
vals_col3_winner_o = "\s\sO\s\sOXXO"
vals_diag_left_winner_x = "XOOOX\s\s\sX"
vals_diag_left_winner_o = "O\s\sXOX\s\sO"
vals_diag_right_winner_x = "OOX\sX\sX\sO"
vals_diag_right_winner_o = "\s\sOXOXO\s\s"
vals_last_winner_o = 'OXXOOOXXO'
vals_last_winner_x = 'XOOXXXOOX'
vals_tie = 'XOXXOOOXO'
player1_num = 0
player2_num = 1
even = 0
odd = 1
mock_board = Board.new
mock_game = Game.new(mock_board)
player1 = mock_game.create_player('Player1')
player2 = mock_game.create_player('Player2')

RSpec.describe Game do
  describe 'turn_incrementor' do
    it 'Should increment the instance variable turn_counter by one' do
      initial_count = mock_game.turn_counter
      mock_game.turn_incrementor
      expect(mock_game.turn_counter).to eql(initial_count + 1)
    end

    it 'Shouldn\'t keep the same value that the instance variable turn_counter had before the method was called' do
      initial_count = mock_game.turn_counter
      mock_game.turn_incrementor
      expect(mock_game.turn_counter).not_to be(initial_count)
    end
  end

  describe 'game_loop_on?' do
    it 'Should return true if the instance turn_counter is less or equal to the instance variable turns' do
      expect(mock_game.game_loop_on?).to eql(true)
    end

    it 'Should return false if the instance turn_counter is larger the instance variable turns' do
      9.times { mock_game.turn_incrementor }
      expect(mock_game.game_loop_on?).to eql(false)
    end
  end

  describe 'create_player' do
    playerx = mock_game.create_player('PlayerX')
    it 'Should created a new instance of a Player' do
      expect(playerx).to be_kind_of(Player)
    end

    it 'Should raise an error when calling create_player method without a parameter' do
      expect { mock_game.create_player }.to raise_error(ArgumentError)
    end

    it 'Should raise an error when calling create_player method with more than one parameter' do
      expect { mock_game.create_player('hello', 'again') }.to raise_error(ArgumentError)
    end

    it 'Should accept any type as an argument' do
      expect(mock_game.create_player(nil)).to be_kind_of(Player)
    end
  end

  describe 'display_scores' do
    it 'should give an array' do
      expect(mock_game.display_scores).to be_kind_of(Array)
    end

    it 'should give an array with three items' do
      expect(mock_game.display_scores.size).to equal(3)
    end

    it 'should contain only integers' do
      expect(mock_game.display_scores.all?(Integer)).to equal(true)
    end

    it 'should return in index 0 the sum of index 1 and index 2' do
      scores = mock_game.display_scores
      sum = scores[1] + scores[2]
      expect(scores[0]).to equal(sum)
    end

    it 'Updates games_played variable when the game ends' do
      none_games = mock_game.display_scores[0]
      mock_game.update_scores
      expect(mock_game.display_scores[0]).to eql(none_games + 1)
    end
  end

  describe 'restart_game?' do
    it 'Should return true if its given parameter is the string "yes"' do
      expect(mock_game.restart_game?('yes')).to eql(true)
    end

    it 'Should return false if its given parameter is the string "no"' do
      expect(mock_game.restart_game?('no')).to eql(false)
    end

    it 'Should raise an Argument error if no parameter is given' do
      expect { mock_game.restart_game? }.to raise_error(ArgumentError)
    end

    it 'Should return nil if a parameter other than the strings "yes" or "no" is given' do
      expect(mock_game.restart_game?(true)).to be(nil)
    end

    it 'Should raise an Argument error if more than one parameter is given' do
      expect { mock_game.restart_game?('true', 'yes') }.to raise_error(ArgumentError)
    end
  end

  describe 'quit_game?' do
    it 'should return true if input given is the symbol quit' do
      expect(mock_game.quit_game?(:quit)).to be(true)
    end

    it 'should return false if input given is not the symbol quit' do
      expect(mock_game.quit_game?('quit')).to be(false)
    end

    it 'should raise an error no parameters are given' do
      expect { mock_game.quit_game? }.to raise_error(ArgumentError)
    end

    it 'should raise an error when more than one parameter is given' do
      expect { mock_game.quit_game?('something', 'else') }.to raise_error(ArgumentError)
    end
  end

  describe 'winner' do
    it 'should raise an error when no input is given' do
      expect { mock_game.winner }.to raise_error(ArgumentError)
    end

    it 'Should raise an Argument error if the wrong number of parameters are given' do
      expect { mock_game.winner('true') }.to raise_error(ArgumentError)
    end

    it 'Should raise an Argument error if the second parameter is no 0 or 1' do
      expect { mock_game.winner(vals_row1_winner_x, 5) }.to raise_error(NoMethodError)
    end

    it 'Should raise an Argument error if the second parameter is not an integer' do
      expect { mock_game.winner(vals_row1_winner_x, '1') }.to raise_error(TypeError)
    end

    it 'Should return nil if the first parameter is a string with less than 9 characters' do
      expect(mock_game.winner('FAGVA', player1_num)).to be(nil)
    end

    it 'Should return nil if the first parameter is a string with less than 9 characters' do
      expect(mock_game.winner('FAGVA', player1_num)).to be(nil)
    end

    it 'Should return \'TIE\' if the first parameter is a string with more than 9 characters' do
      expect(mock_game.winner('FAGVGAHJAAJA', player1_num)).to be('TIE')
    end

    it 'Should raise a type error if the first parameter is not a string' do
      expect { mock_game.winner(545_345, player1_num) }.to raise_error(TypeError)
    end

    context 'For games in which the player wins in a row' do
      it 'Player 2 wins in the first row' do
        expect(mock_game.winner(vals_row1_winner_x, player2_num)).to eql(player2.name)
      end

      it 'Player 2 wins in the second row' do
        expect(mock_game.winner(vals_row2_winner_x, player2_num)).to eql(player2.name)
      end

      it 'Player 2 wins in the third row' do
        expect(mock_game.winner(vals_row3_winner_x, player2_num)).to eql(player2.name)
      end

      it 'Player 1 wins in the first row' do
        expect(mock_game.winner(vals_row1_winner_o, player1_num)).to eql(player1.name)
      end

      it 'Player 1 wins in the second row' do
        expect(mock_game.winner(vals_row2_winner_o, player1_num)).to eql(player1.name)
      end

      it 'Player 1 wins in the third row' do
        expect(mock_game.winner(vals_row3_winner_o, player1_num)).to eql(player1.name)
      end
    end

    context 'For games in which the player wins in a column' do
      it 'Player 2 wins in the first column' do
        expect(mock_game.winner(vals_col1_winner_x, player2_num)).to eql(player2.name)
      end

      it 'Player 2 wins in the second column' do
        expect(mock_game.winner(vals_col2_winner_x, player2_num)).to eql(player2.name)
      end

      it 'Player 2 wins in the third column' do
        expect(mock_game.winner(vals_col3_winner_x, player2_num)).to eql(player2.name)
      end

      it 'Player 1 wins in the first column' do
        expect(mock_game.winner(vals_col1_winner_o, player1_num)).to eql(player1.name)
      end

      it 'Player 1 wins in the second column' do
        expect(mock_game.winner(vals_col2_winner_o, player1_num)).to eql(player1.name)
      end

      it 'Player 1 wins in the third column' do
        expect(mock_game.winner(vals_col3_winner_o, player1_num)).to eql(player1.name)
      end
    end

    context 'For games in which the player wins in a diagonal' do
      it 'Player 2 wins in the left to right diagonal' do
        expect(mock_game.winner(vals_diag_left_winner_x, player2_num)).to eql(player2.name)
      end

      it 'Player 2 wins in the right to left diagonal' do
        expect(mock_game.winner(vals_diag_right_winner_x, player2_num)).to eql(player2.name)
      end

      it 'Player 1 wins in the left to right diagonal' do
        expect(mock_game.winner(vals_diag_left_winner_o, player1_num)).to eql(player1.name)
      end

      it 'Player 1 wins in the right to left diagonal' do
        expect(mock_game.winner(vals_diag_right_winner_o, player1_num)).to eql(player1.name)
      end
    end

    context 'For games in which the winning play happens in the last empty cell in the board' do
      it 'it should return Player 1 name and not TIE if Player 1 wins' do
        expect(mock_game.winner(vals_last_winner_o, player1_num)).not_to eql('TIE')
      end

      it 'it should return Player 2 name and not TIE if Player 2 wins' do
        expect(mock_game.winner(vals_last_winner_x, player2_num)).not_to eql('TIE')
      end
    end

    it 'Should return \'TIE\' in case of the game ending in a tie' do
      expect(mock_game.winner(vals_tie, player1_num)).to eql('TIE')
    end
  end

  describe 'current_player' do
    it 'Returns the player object of P1 if counter is odd' do
      expect(mock_game.current_player(odd)).to equal(player1)
    end

    it 'Returns the player object of P2 if counter is even' do
      expect(mock_game.current_player(even)).to equal(player2)
    end

    it 'Should raise a type error if the parameter is not a Number' do
      expect { mock_game.current_player('1') }.to raise_error(NoMethodError)
    end

    it 'should raise an Argument error when no input is given' do
      expect { mock_game.current_player }.to raise_error(ArgumentError)
    end

    it 'Should raise an Argument error if more than one parameter is given' do
      expect { mock_game.current_player(1, 2) }.to raise_error(ArgumentError)
    end
  end

  describe 'update_scores' do
    it 'Should raise an Argument error if more than one parameter is given' do
      expect { mock_game.update_scores(1, 2) }.to raise_error(ArgumentError)
    end

    it 'Should raise an NoTypeMethod error if the parameter is not an instance of Player' do
      expect { mock_game.update_scores([]) }.to raise_error(NoMethodError)
    end

    context 'Of when a game ends and the scores are updated' do
      it 'Updates games_won variable of P1 when a game is won by P1' do
        initial_games = player1.games_won
        mock_game.update_scores(player1)
        expect(player1.games_won).to eql(initial_games + 1)
      end

      it 'Updates games_won variable of P2 when a game is won by P2' do
        initial_games = player2.games_won
        mock_game.update_scores(player2)
        expect(player2.games_won).to eql(initial_games + 1)
      end

      it 'Does not update games_won variable of P2 when a game is won by P1' do
        initial_games = player2.games_won
        mock_game.update_scores(player1)
        expect(player2.games_won).to eql(initial_games)
      end

      it 'Does not update games_won variable of P1 when a game is won by P2' do
        initial_games = player1.games_won
        mock_game.update_scores(player2)
        expect(player1.games_won).to eql(initial_games)
      end

      it 'The variable games_won does not update (for neither player) when a game is a tie' do
        none_games = mock_game.display_scores[1, 2]
        mock_game.update_scores
        expect(mock_game.display_scores[1, 2]).to eql(none_games)
      end
    end
  end
end

RSpec.describe Player do
  describe 'player_char' do
    it 'Should return a symbol' do
      expect(player1.player_char).to be_kind_of(Symbol)
    end

    it 'Should return alternate between the symbols :X and :O with each instance of a Player' do
      player_characters = [player1.player_char, player2.player_char]
      expect(player_characters).to eql(%i[O X])
    end

    it 'Should return the :O symbol when the first Player is instantiated,
    meaning the class variable player_number is odd' do
      expect(player1.player_char).to eql(:O)
    end

    it 'Should return the :X symbol when the second Player is instantiated,
    meaning the class variable player_number is even' do
      expect(player2.player_char).to eql(:X)
    end
  end

  describe 'player_win' do
    it 'Should increment the games_won instance variable by one when called' do
      initial_games_won = player1.games_won
      player1.player_win
      expect(player1.games_won).to eql(initial_games_won + 1)
    end

    it 'Should not let the games_won instance variable stay the same when called' do
      initial_games_won = player1.games_won
      player1.player_win
      expect(player1.games_won).not_to eql(initial_games_won)
    end
  end

  describe 'initialize' do
    it 'Should initialize its instances with an accessible name variable' do
      expect(player1.name).to be
    end

    it 'Should initialize its instances with an accessible games_won variable' do
      expect(player1.games_won).to be
    end
  end
end

RSpec.describe Board do
  describe 'display_board' do
    it 'Should return a string' do
      expect(mock_board.display_board).to be_kind_of(String)
    end

    it 'Should return a specific string' do
      board = "    1  2  3\n a [\s][\s][\s]
 b [\s][\s][\s]
 c [\s][\s][\s]\n\n"
      expect(mock_board.display_board).to eql(board)
    end
  end

  describe 'board_values' do
    it 'Should return a string' do
      expect(mock_board.board_values).to be_kind_of(String)
    end

    it 'Should return a string with the values of the hash board' do
      expect(mock_board.board_values).to eql("\s\s\s\s\s\s\s\s\s")
    end

    it 'Should return a string with the updated values of the hash board' do
      mock_board.update_board(:a2, player1)
      mock_board.update_board(:b3, player1)
      expect(mock_board.board_values).to eql("\sO\s\s\sO\s\s\s")
    end
  end

  describe 'choice_checker' do
    it 'Should return the string \'INVALID CHOICE\' if the input is not a valid cell in the board' do
      input = :a5
      expect(mock_board.choice_checker(input)).to eql('INVALID CHOICE')
    end

    it 'Should return the string \'INVALID CELL\' if the input is points to a taken cell in the board' do
      mock_board.update_board(:b2, player1)
      input = :b2
      expect(mock_board.choice_checker(input)).to eql('INVALID CELL')
    end

    it 'Should return true if the input is a valid choice and the cell is empty' do
      mock_board.update_board(:a3, player1)
      mock_board.update_board(:c1, player1)
      mock_board.update_board(:c2, player1)
      mock_board.update_board(:c3, player1)
      input = :a1
      expect(mock_board.choice_checker(input)).to eql(true)
    end

    it 'Should raise a type error if the parameter is not a Symbol' do
      expect { mock_game.choice_checker('1') }.to raise_error(NoMethodError)
    end

    it 'should raise an Argument error when no input is given' do
      expect { mock_game.choice_checker }.to raise_error(NoMethodError)
    end

    it 'Should raise an Argument error if more than one parameter is given' do
      expect { mock_game.choice_checker(1, 2) }.to raise_error(NoMethodError)
    end
  end

  describe 'update_board' do
    it 'Should return a hash' do
      expect(mock_board.update_board(:b1, player1)).to be_kind_of(Hash)
    end

    it 'Should return a hash with the updated board values' do
      expect(mock_board.update_board(:a1, player2)).to eql(a1: :X, a2: :O, a3: :O, b1: :O, b2: :O,
                                                           b3: :O, c1: :O, c2: :O, c3: :O)
    end
  end

  describe 'board_reseter' do
    it 'Should reset the Board instance variable to its original value, with empty cells' do
      empty_board = { a1: "\s", a2: "\s", a3: "\s", b1: "\s", b2: "\s", b3: "\s", c1: "\s", c2: "\s", c3: "\s" }
      expect(mock_board.board_reseter).to eql(empty_board)
    end
  end
end
