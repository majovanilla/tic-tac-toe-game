# spec/main_rspec.rb

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
players_array = [player1, player2]

RSpec.describe Game do
  describe 'winner' do
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

  it 'Returns the player object of P1 if counter is odd' do
    expect(mock_game.current_player(odd)).to equal(player1)
  end

  it 'Returns the player object of P2 if counter is even' do
    expect(mock_game.current_player(even)).to equal(player2)
  end

  context 'Of when a game ends and the scores are updated' do
    it 'Updates games_played variable when the game ends' do
      none_games = mock_game.display_scores[0]
      mock_game.update_scores
      expect(mock_game.display_scores[0]).to eql(none_games + 1)
    end

    it 'Updates games_won variable of P1 when a game is won by P1' do
    end

    it 'Updates games_won variable of P2 when a game is won by P2' do
    end

    it 'The variable games_won does not update (for neither player) when a game is a tie' do
    end
  end
  # update_scores
  # restart_game
end

RSpec.describe Player do
  # Test correct creation of instance of Player with name
end

RSpec.describe Board do
  # Test choice checker
  # Test update board and board reseter
end
