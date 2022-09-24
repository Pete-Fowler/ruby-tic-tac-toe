require '../lib/tic_tac_toe'

RSpec.describe tic_tac_toe do
  describe "Game class #initialize" do
    it "creates an array of 9 1 space strings and has an @board attr" do
      game = Game
      expect(game.board).to eq(" ", " ", " ", " ", " ", " ", " ", " ", " ")        
    end
  end
end