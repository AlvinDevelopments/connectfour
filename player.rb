class Player
   def initialize(name,symbol,board)
       @name=name
       @symbol=symbol
       @board=board
   end
   attr_accessor :name, :symbol
   def get_coordinates
       while true
           column=ask_for_coordinates
           if check_for_format(column)
               if @board.add_piece(column.to_i,@symbol)
                   break
               end
           end
       end
   end
   def everything_valid
   end
   def ask_for_coordinates
       puts "#{name}, where would you like to place a game piece? "
       column_number=gets.chomp
       return column_number
   end


  def check_for_format(column)
    i = 0
    @board.get_size.times do
      return true if column == i.to_s
      i+=1
    end
    puts "Wrong Format"
    return false
  end

end
