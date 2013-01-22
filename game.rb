#Jordan and Erik
#w3d2

class Game

  B_RANGE = (0..7).to_a

  attr_reader :current_player

  def initialize
    @player1 = Player.new(:white)
    @player2 = Player.new(:black)
    @board = Board.new
    @current_player = @player1
  end

  def play
    #board.initialize_board
    coords = ask_for_move
  end

  def ask_for_move
    @current_player.get_move
  end

  def validate_move(move)
    return false if pieces_captured(move).empty?
  end

  private

  def pieces_captured(move)

  end

  # takes a simple coordinate representing a direction and our starting coord
  # returns an array of all successful conversions that would be possible
  def get_conversion_chain(start_coords, dir_coords)
    conversion_chain = []
    new_x, new_y = start_coords[0], start_coords[1]
    while true

      new_x += dir_coords[0]
      new_y += dir_coords[1]

      return [] unless B_RANGE.include?(new_x) && B_RANGE.include?(new_y)
      return conversion_chain if @board.board[new_x][new_y] == @current_player.color
      return [] if @board.board[new_x][new_y].nil?
      # ONE MORE CASE, AND SETTING CONVERSION CHAIN
      # until either we hit end of board, nil square, or our own color
      # if our own color, return the array so far
      # else return []
    end
  end

end