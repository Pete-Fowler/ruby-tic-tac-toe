require_relative '../lib/tic_tac_toe'

describe 'Game' do
  let(:game) { Game.new }

  describe "Game class #initialize" do
    it "creates an array of 9 1 space strings and has an @board attr" do
      expect(game.board).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])        
    end
  end

  describe "WIN_COMBOS" do 
    it "has a class constant of all win combos" do 
      expect(Game::WIN_COMBOS).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]])
    end
  end 

  describe "#print_board" do 
    it "prints current state of gameboard" do 
      game.board = ["O", "X", "O", "X", "O", "X", "O", "X", "O"]
      
      $stdout = StringIO.new
      game.print_board
      $stdout.rewind

      expect($stdout.gets).to eq(" O | X | O \n")
      expect($stdout.gets).to eq("-----------\n")
      expect($stdout.gets).to eq(" X | O | X \n")
      expect($stdout.gets).to eq("-----------\n")
      expect($stdout.gets).to eq(" O | X | O \n")
    end
  end

  describe "#input_to_index" do 
    it "takes player input and subtracts one for array index" do 
      expect(game.input_to_index(5)).to eq(4)
      expect(game.input_to_index(2)).to eq(1)
      expect(game.input_to_index(3)).not_to eq(3)
    end
  end 

  describe "#move" do 
    it "takes an index and token, and records a player's move on the board" do 
      expect(game.board[1]).to eq(' ')
      game.move(1, 'X') 
      expect(game.board[1]).to eq('X') 
      expect(game.board[0]).to eq(' ')
      expect(game.board[2]).to eq(' ')
    end 
  end 

  describe "#position_taken?" do 
    it "Returns true/false whether the position is taken" do 
      game.board = ["O", " ", "O", "X", "O", "X", "O", "X", "O"]

      expect(game.position_taken?(3)).to eq(true)
      expect(game.position_taken?(1)).to eq(false)
    end
  end

  describe "#valid_move?" do 
    it "Returns true if position not taken and move is on board" do 
      game.board = ["O", " ", "O", "X", "O", "X", "O", "X", "O"]

      expect(game.valid_move?(1)).to eq(true)
      expect(game.valid_move?(2)).to eq(false)
      expect(game.valid_move?(9)).to eq(false)
      expect(game.valid_move?(-1)).to eq(false)

    end 
  end 

  describe "#turn_count" do 
    it "Returns turn count based on board" do 
      game.board = ["O", " ", "O", "X", "O", "X", "O", "X", "O"]
      expect(game.turn_count).to eq(8)
     
      game.board = ["O", " ", "O", "X", " ", " ", " ", " ", " "]
      expect(game.turn_count).to eq(3)
    end 
  end 

  describe "#current_player" do 
    it "Returns X or O depending on turn_count" do 
      game.board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      expect(game.current_player).to eq('X')

      game.board = [" ", "X", " ", " ", " ", " ", " ", " ", " "]
      expect(game.current_player).to eq('O')

     
      game.board = ["O", " ", "O", "X", "X", "O", "X", "O", "X"]
      expect(game.current_player).to eq('X')
    end 
  end 

  describe '#turn' do

    it 'receives user input via the gets method' do
      expect(game).to receive(:gets).and_return("1")

      game.turn
    end

    it "calls #input_to_index, #valid_move?, and #current_player" do
      expect(game).to receive(:gets).and_return("5")
      expect(game).to receive(:input_to_index).and_return(4)
      expect(game).to receive(:valid_move?).and_return(true)
      expect(game).to receive(:current_player).and_return("X")

      game.turn
    end

    it 'makes valid moves and displays the board' do
      expect(game).to receive(:gets).and_return("1")
      expect(game).to receive(:print_board)

      game.turn

      board = game.instance_variable_get(:@board)
      expect(board).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'asks for input again after a failed validation' do
      expect(game).to receive(:gets).and_return("invalid")
      expect(game).to receive(:gets).and_return("1")

      game.turn
    end
  end

  describe '#won' do 
    it 'returns false for no win combination' do 
      board = ["X", "O", "X", 
              "X", "X", "O", 
              "O", "O", "X"]
    game.instance_variable_set(:board, board) 

    expect(game.won?).to be_falsey 
    
    end 
  end 
  
end