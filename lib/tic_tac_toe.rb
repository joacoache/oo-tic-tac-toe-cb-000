class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      true
    else
      false
    end
  end

  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    return turn
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    player_token = current_player
    if valid_move?(index)
      position_taken?(index)
      move(index, player_token)
      display_board
    else
      turn
    end
  end

  def won?
    match_array = []
    WIN_COMBINATIONS.each do |index|
      if (@board[index[0]] == "X" && @board[index[1]] == "X" && @board[index[2]] == "X") || (@board[index[0]] == "O" && @board[index[1]] == "O" && @board[index[2]] == "O")
        index.each do |a|
          match_array << a
        end
      end
    end
    if match_array.empty? == true || match_array.nil? == true
      false
    else
      return match_array
    end
  end

  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    end
  end

  def draw?
    if won? == false && full? == true
      true
    else
      false
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
     win = nil
     WIN_COMBINATIONS.each do |index|
       if (@board[index[0]] == "X" && @board[index[1]] == "X" && @board[index[2]] == "X")
         win = "X"
       elsif (@board[index[0]] == "O" && @board[index[1]] == "O" && @board[index[2]] == "O")
         win = "O"
       end
     end
     return win
  end

  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
