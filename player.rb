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
           if check_for_format(column.to_i)
               if @board.add_piece(column,@symbol)
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
   end
   def check_for_format(column)
       if column>=0 && column<=6
           return true
       else
           puts "Wrong Format"
           return false
       end
   end
end
