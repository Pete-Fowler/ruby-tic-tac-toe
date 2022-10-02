require 'pry'

class Game 
  attr_reader :WIN_COMBOS
  attr_accessor :board

  WIN_COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]]
    
  def initialize 
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end

  def print_board 
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(int)
    int - 1
  end

  def position_taken?(int) 
    board[int] != ' '
  end

  def valid_move?(int) 
    position_taken?(int) == false && int.between?(0, 8) == true
  end 
end
