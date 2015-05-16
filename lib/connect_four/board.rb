# board class for the connectfour game
class Board
  ROWS, COLS = 6, 7
  PIECE = "\u2609"
  ARROW = "\uffec"

  attr_reader :board

  def initialize
    clear_board
  end

  def clear_board
    @board = Array.new(COLS) { Array.new(ROWS) {:blank} }
  end

  def place_piece_in_column(piece, col)
    first_blank_index = @board[col].index(:blank)
    return if first_blank_index.nil?
    @board[col][first_blank_index] = piece
  end

  def display_board
    puts "Choose column to place a piece by the numbers below"
    puts "\t" " 1  2  3  4  5  6  7"
    puts "\t" + (" #{ARROW} " * COLS)

    (ROWS - 1).downto(0) do |row|
      print "\t"
      0.upto(COLS - 1) { |col| print color(" #{PIECE} ", @board[col][row]) }
      puts "\n\t" + color(" " * (3 * COLS), :blank)
    end
  end

  def color(text, color)
    case color
    when :red then colorize(text, "1;31;44")
    when :yellow then colorize(text, "1;33;44")
    when :flip then colorize(text, "7")
    when :blank then colorize(text, "1;34;44")
    else colorize(text, "0")
    end
  end

  def colorize(text, color_code)
    "\033[#{color_code}m#{text}\033[0m"
  end
end