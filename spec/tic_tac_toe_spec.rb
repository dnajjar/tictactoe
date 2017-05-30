require_relative "../lib/tic_tac_toe.rb"
require 'stringio'

describe TicTacToe do
      before (:each) do
            @game = TicTacToe.new      
      end 

      it "initializes correctly" do
            expect(@game.board).to eq [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
            expect(@game.turn).to eq 0
      end

      it "correctly determines the current player and their symbol" do
            @game.determine_player
            expect(@game.player).to eq '1'
            expect(@game.symbol).to eq 'X'
            @game.turn = 3
            @game.determine_player
            expect(@game.player).to eq '2'
            expect(@game.symbol).to eq 'O'
      end

      it "handles incorrect inputs" do
            @game.symbol = 'X'
            @game.stub(:gets).and_return('abcd', '2')
            @game.move
            expect(@game.board[1]).to eq ('X')
            @game.symbol ='O'
            @game.stub(:gets).and_return('abcd', '3')
            @game.move
            expect(@game.board[2]).to eq ('O')
      end 

      it "does not overwrite cells" do
            @game.board[0] = 'O'
            @game.symbol = 'X'
            @game.stub(:gets).and_return('1', '2')
            @game.move
            expect(@game.board[0]).to eq ('O')
            expect(@game.board[1]).to eq ('X')
      end

      it "correctly recognizes winning combinations" do
            @game.board[2], @game.board[5], @game.board[8] = [' '] * 3      
            expect(@game.wins).to eq false
            @game.board[3], @game.board[4], @game.board[8] = ['x'] * 3      
            expect(@game.wins).to eq false
            @game.board[0], @game.board[1], @game.board[6] = ['O'] * 3      
            expect(@game.wins).to eq false            
            @game.board[0], @game.board[4], @game.board[8] = ['X'] * 3  
            expect(@game.wins).to eq true
            @game.wins = false
            @game.board[2], @game.board[4], @game.board[6] = ['O'] * 3  
            expect(@game.wins).to eq true
            @game.wins = false
            @game.board[0], @game.board[1], @game.board[2] = ['O'] * 3
            expect(@game.wins).to eq true
            @game.wins = false
            @game.board[3], @game.board[4], @game.board[5] = ['X'] * 3
            expect(@game.wins).to eq true
            @game.wins = false
            @game.board[6], @game.board[7], @game.board[8] = ['X'] * 3      
            expect(@game.wins).to eq true
            @game.wins = false
            @game.board[0], @game.board[3], @game.board[6] = ['O'] * 3
            expect(@game.wins).to eq true
            @game.wins = false
            @game.board[1], @game.board[4], @game.board[7] = ['X'] * 3
            expect(@game.wins).to eq true
            @game.wins = false
            @game.board[2], @game.board[5], @game.board[8] = ['X'] * 3      
            expect(@game.wins).to eq true
      end 

end
