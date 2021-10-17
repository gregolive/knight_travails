# frozen_string_literal: true

# Prints the fastest route for a knight to move between two locations on a chess board

def chess_board
  <<~HEREDOC
      ┏━━┳━━┳━━┳━━┳━━┳━━┳━━┳━━┓
    1 ┃  ┃░░┃  ┃░░┃  ┃░░┃  ┃░░┃
      ┣━━╋━━╋━━╋━━╋━━╋━━╋━━╋━━┫
    2 ┃░░┃  ┃░░┃  ┃░░┃  ┃░░┃  ┃
      ┣━━╋━━╋━━╋━━╋━━╋━━╋━━╋━━┫
    3 ┃  ┃░░┃  ┃░░┃  ┃░░┃  ┃░░┃
      ┣━━╋━━╋━━╋━━╋━━╋━━╋━━╋━━┫
    4 ┃░░┃  ┃░░┃  ┃░░┃  ┃░░┃  ┃
      ┣━━╋━━╋━━╋━━╋━━╋━━╋━━╋━━┫
    5 ┃  ┃░░┃  ┃░░┃  ┃░░┃  ┃░░┃
      ┣━━╋━━╋━━╋━━╋━━╋━━╋━━╋━━┫
    6 ┃░░┃  ┃░░┃  ┃░░┃  ┃░░┃  ┃
      ┣━━╋━━╋━━╋━━╋━━╋━━╋━━╋━━┫
    7 ┃  ┃░░┃  ┃░░┃  ┃░░┃  ┃░░┃
      ┣━━╋━━╋━━╋━━╋━━╋━━╋━━╋━━┫
    8 ┃░░┃  ┃░░┃  ┃░░┃  ┃░░┃  ┃
      ┗━━┻━━┻━━┻━━┻━━┻━━┻━━┻━━┛
  　　 1  2  3  4  5  6  7  8
  HEREDOC
end

def print_moves(knight)
  moves = list_moves(knight)
  puts "The knight made it from #{moves[0]} to #{moves[moves.length - 1]} in #{moves.length - 1} moves!\n"
  moves.each { |move| p move }
end

def list_moves(knight, output = [])
  list_moves(knight.parent, output) unless knight.parent.nil?
  output.push(knight.location)
end

# Track knight's movements
class BoardNode
  attr_reader :location, :parent

  MOVES = [[1,-2], [2,-1], [2,1], [1,2], [-1,2], [-2,1], [-2,-1], [-1,-2]]

  @@past_moves = []

  def initialize(location, parent)
    @location = location
    @parent = parent
    @@past_moves.push(location)
  end

  def possible_moves
    moves = MOVES.map { |dir| [(@location[0] + dir[0]),(@location[1] + dir[1])]}
                 .keep_if { |move| possible(move) }
                 .map { |move| BoardNode.new(move, self) }
  end

  def possible(move)
    on_board(move) && !@@past_moves.include?(move) ? true : false
  end

  def on_board(move)
    move[0].between?(1,8) && move[1].between?(1,8) ? true : false
  end
end

def knight_moves(start, goal, queue = [])
  puts chess_board
  knight = BoardNode.new(start, nil)
  until knight.location == goal
    knight.possible_moves.each { |move| queue.push(move) }
    knight = queue.shift()
  end
  print_moves(knight)
end

knight_moves([3,3],[4,3])
