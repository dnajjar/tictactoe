class TicTacToe

	attr_accessor :board, :turn, :wins, :player, :symbol

	def initialize
		@board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
		@turn = 0
	end 

	def play		
		until wins == true
			if @turn == 9
				puts("That's a tie folks!")
				break
			end
			determine_player
			move 
			print_board 
			@turn += 1
		end
	end 

	def determine_player
		if @turn %2 == 0
			@symbol = 'X'
			@player = '1'
		else 
			@symbol = 'O'
			@player = '2'
		end
	end 

	def move
		print("Player #{@player} - Enter a number from 1 to 9: ")
		position = gets.to_i
		if  position.between?(1, 10) and @board[position - 1] == ' '
			@board[position - 1] = @symbol
		else 
			move
		end
	end 

	def wins
		winning_row = [0,1,2], [3,4,5], [6,7,8]
        winning_col = [0,3,6], [1,4,7], [2,5,8]
        winning_diag = [0, 4, 8], [6,4,2]
        winning_combos = winning_row + winning_col + winning_diag
        for combo in winning_combos
        	if @board[combo[0]] != ' ' and @board[combo[0]] == @board[combo[1]] and @board[combo[1]] == @board[combo[2]]
        		puts("Player #{@player} wins!") 
        		return true
        	end 
        end 
        return false
	end 

	def print_board 
		puts "\n"
        puts "#{@board[0]} | #{@board[1]} | #{@board[2]}  "
        puts '- - - - -'
        puts "#{@board[3]} | #{@board[4]} | #{@board[5]}  "
        puts '- - - - -'
        puts "#{@board[6]} | #{@board[7]} | #{@board[8]}  "
        puts "\n"
    end 
end 
