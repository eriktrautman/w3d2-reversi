#Jordan and Erik
#w3d2

require 'rspec'
require_relative 'reversi'
require_relative 'player'
require_relative 'game'

describe Board do
  subject(:gameboard) {Board.new}
  describe "#initialize" do
    it "has 8 rows" do
      gameboard.board.length.should eq(8)
    end

    it "has 8 squares in a row" do
      gameboard.board.each do |row|
        row.length.should eq(8)
      end
    end

    it "is filled with nils" do
      gameboard.board.each do |row|
        row.each do |cell|
          cell.should be_nil
        end
      end
    end
  end


  describe "#populate_board" do
    it "sets the first four pieces properly" do
      gameboard.populate_board
      gameboard.board[3][3].should eq(:white)
      gameboard.board[3][4].should eq(:black)
      gameboard.board[4][3].should eq(:black)
      gameboard.board[4][4].should eq(:white)
    end
  end

  context "with populated board" do

    before(:each) { gameboard.populate_board }

    describe "#place_piece" do
      it "places a piece in an empty space" do
        gameboard.place_piece(:white, [1, 1])
        gameboard.board[1][1].should eq(:white)
      end

      it "won't place a piece in a taken space" do
        expect do
          gameboard.place_piece(:white, [3, 4])
        end.to raise_error("space is taken!")
      end
    end

    describe "#toggle_pieces" do

      it "will change the color of a piece at coords" do
        gameboard.toggle( [[3, 3]] )
        gameboard.board[3][3].should eq(:black)
      end

      it "will toggle an array of piece coords" do
        gameboard.toggle( [[3, 3], [3, 4]] )
        gameboard.board[3][3].should eq(:black)
        gameboard.board[3][4].should eq(:white)
      end

      it "will raise an error if space is empty" do
        expect do
          gameboard.toggle( [[3, 3], [5, 4]] )
        end.to raise_error("nothing to toggle!")
      end

      it "will raise an error if coord array is empty" do
        expect do
          gameboard.toggle( [[3, 3], []] )
        end.to raise_error("need coordinate to toggle!")
      end
    end

    describe "#count_pieces" do
      it "properly counts player pieces" do
        gameboard.count_pieces.should eq({:white => 2, :black => 2})
      end
    end
  end
end

describe Player do

end

describe Game do

  subject(:game) { Game.new }

  before(:each) do
    player1 = double("Player1", :color => :white)
    player2 = double("Player2", :color => :black)
  end

  specify { game.current_player.should be_a(Player) }

  describe " #play" do

    describe "#ask_for_move" do
      it "asks current player for move" do
        game.current_player.should_receive(:get_move)
        game.ask_for_move
      end
    end

    describe "#validate_move" do

      before(:each) do
        gameboard = Board.new
        gameboard.populate_board # Is this appropriate?  Do we need to stub it out?
      end

      describe "fails" do

        specify "when no pieces are captured" do
          game.validate_move([2, 2]).should be_false
        end

        specify "if moving onto another piece"

        specify "if placing piece off the board"

      end

      describe "passes" do

        specify "when move is valid" do
          game.validate_move([2, 4]).should be_true
        end

      end
    end

    describe "#captured_pieces" do

    end

    describe "#place_piece" do

    end

    describe "#toggle_pieces" do

    end

    describe "#toggle_current_player" do

    end

    describe "#game_over?" do

    end

  end

end


















