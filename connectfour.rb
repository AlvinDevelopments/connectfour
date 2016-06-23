class Game

  def initialize()
  end

  def check_win
  end

  def render

  end

  def start_game()
    puts "Hi Player One!! Please enter your name!!"
    player_one = Player.new(gets.chomp)
    puts "Hi Player Two!! Please enter your name!!"
    player_two = Player.new(gets.chomp)
  end



end


class Player

  attr_accessor: name

  def initialize(name)
    @name = name
  end

end

class GamePiece
  attr_accessor: style


end

class Board

  def initialize()
    @board = Array.new(7,0)
    @board.each { |x| x = Array.new(6)}
  end

  def drop_piece(piece_type, col)
    @board[col].each {|x| x = piece_type if x == 0 }
  end

  def clear_board()
    @board.each { |x|
      x.each { |y|
        @board[x][y] = 0
      }
    }
  end

end
