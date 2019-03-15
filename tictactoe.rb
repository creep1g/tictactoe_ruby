#The Odin Project Tic Tac Toe project!
class Game
  attr_accessor :player_a, :player_b

  @@board = [" ", " ", " ", " ", " ", " " , " ", " ", " "]

  def initialize(player_a, player_b)
    @player_a = player_a
    @player_b = player_b
    print_board
  end

  def player_a_turn(index)
    @@board[index] = "X"  
    print_board
  end

  def player_b_turn(index)
    @@board[index] = "O" 
    print_board
  end

  def game_over?
    if  player_a_won? == true
      puts "#{@player_a} wins!"
      return true
    elsif player_b_won? == true
      puts "#{@player_b} wins!"
      return true
    elsif @@board[0..8].all? { |i| i != " "}
      puts "Board is full, no winners today!"
      return true
    else 
      return false
    end
  end


  def round(player_id)
    valid = false
    while valid == false
      input = gets.chomp
      if check_index(input.to_i) == false
        puts "Position is already used"
        puts         "Please try again"
      else
        if check_string(input) != true
          puts "You can only input numbers between 0-8"
          puts "please try again:"
        else
          if player_id == 1
            player_a_turn(input.to_i) 
            valid = true
          else 
            player_b_turn(input.to_i) 
            valid = true
          end
        end
      end
    end
  end

 

  private
  def player_a_won?
    #checks horizontal
    if @@board[0..2].all? { |i| i == "X"} ||
       @@board[3..5].all? { |i| i == "X"} || 
       @@board[6..8].all? { |i| i == "X"}
      return true
    #checks vertical 
    elsif (@@board[0] == "X" && @@board[3] == "X" && @@board[6] == "X") || 
          (@@board[1] == "X" && @@board[4] == "X" && @@board[7] == "X") || 
          (@@board[2] == "X" && @@board[5] == "X" && @@board[8] == "X") 
      return true
    #check slash?
    elsif (@@board[0] == "X" && @@board[4] == "X" && @@board[8] == "X") ||
          (@@board[2] == "X" && @@board[4] == "X" && @@board[6] == "X")
      return true
    else
      return false
    end
  end

  def player_b_won?
    #checks horizontal
    if @@board[0..2].all? { |i| i == "O"} ||
       @@board[3..5].all? { |i| i == "O"} ||
       @@board[6..8].all? { |i| i == "O"}
      return true
    #checks vertical   
    elsif (@@board[0] == "O" && @@board[3] == "O" && @@board[6] == "O") || 
          (@@board[1] == "O" && @@board[4] == "O" && @@board[7] == "O") || 
          (@@board[2] == "O" && @@board[5] == "O" && @@board[8] == "O")
      return true
     #check slash?
    elsif (@@board[0] == "O" && @@board[4] == "O" && @@board[8] == "O") ||
          (@@board[2] == "O" && @@board[4] == "O" && @@board[6] == "O")
      return true
    else
      return false
    end
  end

  
  def print_board
    puts
    puts "#{@@board[0]} | #{@@board[1]} | #{@@board[2]}"
    puts "---------"
    puts "#{@@board[3]} | #{@@board[4]} | #{@@board[5]}"
    puts "---------"
    puts "#{@@board[6]} | #{@@board[7]} | #{@@board[8]}"
    puts
  end

  def check_string(string)
    string.scan(/\D/).empty?
  end

  def check_index(index)
    if @@board[index] == " "
      #"Position is clear"
      return true
    else
      #"Position is already used"
      return false
    end
  end
end

puts                              "Welcome to tic-tac-toe"
puts "To play the game you enter a number between 0 and 8"
puts         "Each number repesents a square on the board"
puts                          "Please enter Player 1 name"
player_a = gets.chomp
puts "Please enter Player 2 name"
player_b = gets.chomp
game = Game.new(player_a, player_b)

while game.game_over? != true
  player_id = 1
  game.game_over?
  puts "#{player_a}'s turn"
  game.round(player_id)
  player_id += 1

  break if game.game_over? == true

  puts "#{player_b}'s turn"
  game.round(player_id)
  player_id -= 1
end
