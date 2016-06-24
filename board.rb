class Array
  def safe_transpose
    max_size = self.map(&:size).max
    self.dup.map{|r| r << nil while r.size < max_size; r}.transpose
  end
end


class Board

   def get_size
     return @board.size
   end

   def initialize
       @board = Array.new(7){Array.new(6, "z")}
       @counter = 0
       @column=0
       @rowcoordinate=0
   end

   def render
       puts "--------- CONNECT 4 ---------"
       puts "-----------------------------"
       # if @counter>0
       #     monkey_around
       #     counter += 1
       # end
       @board.safe_transpose.each do |row|
           row.each do |cell|
               print "|"
               if cell == "z"
                 print("---")
               else
                 print(" #{cell.to_s} ")
               end
           end
       print "|"
       puts
       puts "-----------------------------"
       end

   end
   def add_piece(column,symbol)
          @column=column
       		i=6
       		while i >= 0
       			if @board[column.to_i][i] == "z"
       				@board[column.to_i][i]= symbol
       				@rowcoordinate=i
       				return true
       			else
       				i-=1
       			end
       		end
          puts "That column is full!! Please try another column."
          render
       		return false
   end

   def column_avaliable?
       if @board[@column.to_i][@board.size-1] == "z"
           return false
       else
           return true
       end
   end
   def winning_combination?
       winning_vertical? || winning_horizontal? || winning_diagonal?
       #winning_diagonal? || winning_vertical? || winning horizontal?
   end
   def winning_vertical?
       # coordinate=[@column,@rowcoordinate]
       # verticalarray=[@board[@column.to_i][@rowcoordinate.to_i],@board[@column.to_i][@rowcoordinate.to_i-1],@board[@column.to_i][@rowcoordinate.to_i-2],@board[@column.to_i][@rowcoordinate.to_i-3]]
       verticalarray=[@board[@column.to_i][5],@board[@column.to_i][4],@board[@column.to_i][3],
       @board[@column.to_i][2],@board[@column.to_i][1],@board[@column.to_i][0]]
       four_in_a_row?(verticalarray)
   end
   def four_in_a_row?(arr)
       arr.join.to_s.include?("XXXX") || arr.join.to_s.include?("OOOO")
   end
   def winning_horizontal?
   		horizontalarray=[@board[0][@rowcoordinate],@board[1][@rowcoordinate],
      @board[2][@rowcoordinate],@board[3][@rowcoordinate],@board[4][@rowcoordinate],
      @board[5][@rowcoordinate], @board[6][@rowcoordinate]]
   		four_in_a_row?(horizontalarray)
   end

   def winning_diagonal?

    n = 0
    d1 = []

    # finding the start point of d1, which is the bottom left corner

    # keep going down diagonal until hitting a border starting at piece origin
    while @rowcoordinate+n < @board[0].size-1 && (@column.to_i)-n > 0
      n+=1
    end

    # keep going up diagonal until hitting a border starting at the starting point of d1
    # insertting each coordinate piece into d1
    while @rowcoordinate+n >= 0 && (@column.to_i)-n < @board.size
      d1 << @board[(@column.to_i)-n][@rowcoordinate+n]
      n-=1
    end

    # if d1 has a four in a row return true, if not, continue with d2
    return true if four_in_a_row?(d1)

    n = 0
    d2 = []

    # finding the start point of d2, which is the bottom left corner

    # keep going down diagonal until hitting a border starting at piece origin
    while (@column.to_i)+n < @board.size-1 && @rowcoordinate+n < @board[0].size-1
      n+=1
    end

    # keep going up diagonal until hitting a border starting at the starting point of d2
    # insertting each coordinate piece into d2
    while @rowcoordinate+n >= 0 && (@column.to_i)+n >= 0
      d2 << @board[(@column.to_i)+n][@rowcoordinate+n]
      n-=1
    end

     # if d1 has a four in a row, if not, return false
     return true if four_in_a_row?(d2)
     return false

end

end
