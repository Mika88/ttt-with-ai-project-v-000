require 'pry'
module Players
  class Computer < Player
    def move(board)
       input = nil
        Game::WIN_COMBINATIONS.find do |w|
          if w.select{|i| board.position(i + 1) == token}.size == 2 && w.any?{|i| board.position(i + 1) == " "}
            input = w.select{|i| !board.taken?(i + 1)}.first.to_i.+(1).to_s
          elsif w.select{|i| board.position(i + 1) != " " && board.position(i + 1) != token}.size == 2 && w.any?{|i| board.position(i + 1) == " "}
            input = w.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          elsif input == nil
             input = ["5", "1", "3", "7", "9", "2", "4", "6", "8"].find{|i| !board.taken?(i + 1)}.to_s
          end
       input
     end
   end
 end
end
