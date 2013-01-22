#Jordan and Erik
#w3d2

class Board

  attr_reader :board

  def initialize
    @board = Array.new(8) {Array.new(8) {nil}}
  end

  def populate_board
    @board[3][3], @board[4][4] = :white, :white
    @board[3][4], @board[4][3] = :black, :black
  end

  def place_piece(color, coords)
    raise("space is taken!") unless @board[coords.first][coords.last].nil?
    @board[coords.first][coords.last] = color
  end

  def toggle(coords_arr)
    coords_arr.each do |coord_pair|
      raise("need coordinate to toggle!") if coord_pair == []
      raise("nothing to toggle!") if @board[coord_pair[0]][coord_pair[1]] == nil
    end
    coords_arr.each do |coord_pair|
      y, x = coord_pair[0], coord_pair[1]
      @board[y][x] == :white ? @board[y][x] = :black : @board[y][x] = :white
    end
  end

  def count_pieces
    count = Hash.new(0)
    @board.each do |row|
      row.each do |cell|
        count[cell] += 1 unless cell.nil?
      end
    end
    count
  end

  def print_board
    puts board.inspect
  end

end