require 'pry'

class Game 
  attr_reader :WIN_COMBOS
  attr_accessor :board

  WIN_COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]
    
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

  def move(index, token)
    @board[index] = token
  end 

  def position_taken?(int) 
    board[int] != ' '
  end

  def valid_move?(int) 
    position_taken?(int) == false && int.between?(0, 8) == true
  end 

  # the count is the number of turns played
  def turn_count 
    i = 0
    board.each do |position| 
      if position != ' '
        i += 1
      end 
    end 
    i
  end 

  def current_player 
    turn_count.even? ? "X" : "O"
  end

  def turn 
    token = current_player
    puts "#{token} - enter a move using 1-9" 
    user_input = gets.chomp.to_i 
    move = input_to_index(user_input) 
    if valid_move?(move)
      move(move, token)
      print_board
    else 
      turn
    end
  end 

  def won? 
    result = []
    WIN_COMBOS.each do |combo| 
      if (@board[combo[0]] == 'X' && @board[combo[1]] == 'X' && @board[combo[2]] == 'X') || (@board[combo[0]] == 'O' && @board[combo[1]] == 'O' && @board[combo[2]] == 'O')
        return combo
      end
    end 
    return false
  end 

  def full?
    @board.none? do |el| 
      el == ' '
    end 
  end 

  def draw? 
    if won? == false && full? == true 
      return true 
    else
      return false
    end 
  end 

  def winner 
    
    if won? != false
      return @board[won?[0]] 
    else 
      return nil
    end 
  end 

end
