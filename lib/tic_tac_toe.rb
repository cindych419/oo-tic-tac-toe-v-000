require "pry"
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  @board[index] != " "
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
      true
  else
      false
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
    if valid_move?(index)
        move(index, current_player)
    else
        turn
    end
  display_board
end
def won?
  WIN_COMBINATIONS.detect do |combo|
  @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
end

def full?
  @board.all?{|combo| combo == "X" || combo== "O"}
end

def draw?
  !won? && full?
end

def over?
  draw? || won? && full? || won? && !full?
end

def winner
  binding.pry
    #if winning_combo = won?@board[winning_combo.first]
  #end
end
end
