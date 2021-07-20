class TicTacToe

    def initialize(board = nil)
        @board = board || Array.new(9, " ")

    end
    
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [0,4,8],
        [1,4,7],
        [2,5,8],
        [2,4,6]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_move = user_input.to_i 
        array_move = user_move - 1
    end

    def move(position, token = "X")
        @board[position] = token
    end

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            return true
        else
            return false
        end
    end

    def valid_move?(position)
        if position > 8 || position < 0
            return false
        elsif 
            position_taken?(position) == true
            return false
        else
            return true
        end
    end

    def turn_count
        empty_spaces = @board.count{ |space| space == " "}

        return 9 - empty_spaces
    end

    def current_player
        if turn_count.to_i.even?
            return "X"
        elsif turn_count.to_i.odd?
            return "O"
        end
    end

    def turn
        puts "Please select a move between 1 and 9:"
        player_input = gets

        converted_input = input_to_index(player_input)
        
        if valid_move?(converted_input) != true
            turn
        else 
            move(converted_input, current_player)
            display_board
        end

    end

    def won?
        WIN_COMBINATIONS.any? do |winner|
            if (@board[winner[0]]) == "X" && (@board[winner[1]]) == "X" && (@board[winner[2]]) == "X"
                return winner
            elsif
                (@board[winner[0]]) == "O" && (@board[winner[1]]) == "O" && (@board[winner[2]]) == "O"
                return winner
            end
        end
    end

    def full?
        if @board.count{ |space| space == " "} == 0 && won? == false
            return true
        else
            return false
        end
    end

    def draw?
        if full? == true && won? == false
            return true
        else
            return false
        end
    end

    def over?
        if draw? == true || won? != false
            return true
        else 
            return false
        end
    end

    def winner
       if won? == false
        return nil
       elsif @board[won?[0]] == "O"
        return "O"
       elsif @board[won?[0]] == "X"
        return "X"
       end  
    end

    def play
       until over? == true
        turn
       end

       if won? != false
        if winner == "X"
            puts "Congratulations X!"
        elsif winner == "O"
            puts "Congratulations O!"
        end
    end

       if draw? == true
        puts "Cat's Game!"
       end
        


    end




end