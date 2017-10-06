require_relative './lib/00_tree_node'
require 'byebug'

class KnightPathFinder

  DELTAS = [[2, 1], [2, -1], [-2, 1], [-2, -1],[1, 2], [1, -2], [-1, 2], [-1, -2] ]

  def initialize(pos)
    @start_pos = pos
    @move_tree = PolyTreeNode.new(pos)
    @visited_positions = [pos]
  end

  def new_move_positions(pos)
    # valid moves gives us all possible
    # filter out any positions already in @visited_positions
    new_moves = valid_moves(pos)
    new_moves.reject! { |move| @visited_positions.include?(move) }
    new_moves.each { |move| @visited_positions << move }
    # new_moves
  end

  def build_move_tree
    queue = [@move_tree]
    until queue.empty?
      current_node = queue.shift
      current_pos = current_node.value
      new_moves = new_move_positions(current_pos)
      new_moves.each do |move|
        new_node = PolyTreeNode.new(move)
        queue << new_node
        current_node.add_child(new_node)
      end
    end
    puts "#{@move_tree.count}"
    @move_tree
  end

  def find_path(end_pos)
    end_node = @move_tree.bfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    path = []
    current_node = end_node
    until current_node.parent.nil?
      current_pos = current_node.value
      path << current_pos
      current_node = current_node.parent
    end
    path << @move_tree.value
    path.reverse
  end

  private
  def valid_moves(pos)
    # return as many possible positions on the board
    x,y = pos
    moves = []
    DELTAS.each do |d_x, d_y|
      move = [(d_x + x), (d_y + y)]
      if in_board?(move)
        moves << move
      end
    end
    moves
  end

  def in_board?(pos)
    x, y = pos
    # TODO: between?
    not_negative = (x >= 0) && (y >= 0)
    within_bounds = (x <= 7) && (y <= 7)
    not_negative && within_bounds
  end
end
