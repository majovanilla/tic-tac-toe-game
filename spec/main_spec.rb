# spec/main_rspec.rb

# frozen_string_literal: true

require './lib/game_logic.rb'
vals_row1_winner_x = "XXX\sOO\sO\s"
vals_row2_winner_x = "OO\sXXX\s\sO"
vals_row3_winner_x = "O\sOO\s\sXXX"
vals_row1_winner_o = "OOO\s\sX\s\sX"
vals_row2_winner_o = "X\s\sOOO\s\sX"
vals_row3_winner_o = "\sXX\s\s\sOOO"
vals_diag_winner = ''
vals_last_winner = ''
player1_num = 0
player2_num = 1
mock_board = Board.new
mock_game = Game.new(mock_board)
player1 = mock_game.create_player('Player1')
player2 = mock_game.create_player('Player2')

RSpec.describe Game do
  describe 'winner' do
    it 'Returns the winner name in a string when the player wins in the first row' do
      expect(mock_game.winner(vals_row1_winner_x, player2_num)).to eql(player2.name)
    end

    it 'Returns the winner name in a string when the player wins in the second row' do
      expect(mock_game.winner(vals_row2_winner_x, player2_num)).to eql(player2.name)
    end

    it 'Returns the winner name in a string when the player wins in the third row' do
      expect(mock_game.winner(vals_row3_winner_x, player2_num)).to eql(player2.name)
		end
		
    it 'Returns the winner name in a string when the player wins in the first row' do
      expect(mock_game.winner(vals_row1_winner_o, player1_num)).to eql(player1.name)
    end

    it 'Returns the winner name in a string when the player wins in the second row' do
      expect(mock_game.winner(vals_row2_winner_o, player1_num)).to eql(player1.name)
    end

    it 'Returns the winner name in a string when the player wins in the third row' do
      expect(mock_game.winner(vals_row3_winner_o, player1_num)).to eql(player1.name)
    end
  end
end
