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
    if  winner?("X") == true
      puts "#{@player_a} wins!"
      return true
    elsif winner?("X") == true
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

  def winner?(piece)
        #checks horizontal
    if @@board[0..2].all? { |i| i == piece} ||
       @@board[3..5].all? { |i| i == piece} || 
       @@board[6..8].all? { |i| i == piece}
      return true
    #checks vertical 
    elsif (@@board[0] == piece && @@board[3] == piece && @@board[6] == piece) || 
          (@@board[1] == piece && @@board[4] == piece && @@board[7] == piece) || 
          (@@board[2] == piece && @@board[5] == piece && @@board[8] == piece) 
      return true
    #check slash?
    elsif (@@board[0] == piece && @@board[4] == piece && @@board[8] == piece) ||
          (@@board[2] == piece && @@board[4] == piece && @@board[6] == piece)
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
puts                          "Please enter Player 2 name"
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
