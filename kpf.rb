require_relative './lib/00_tree_node'

class KnightPathFinder

  DELTAS = [[2, 1], [2, -1], [-2, 1], [-2, -1],[1, 2], [1, -2], [-1, 2], [-1, -2] ]

  def initialize(pos)
    @start_pos = pos
    @move_tree = []
    @visited_positions = [pos]
  end

  def new_move_positions(pos)
    # return positions you can move to from a given position
    # filter out any positions already in @visited_positions
  end

  def build_move_tree

  end

  def find_path(end_pos)

  end

  def trace_path_back

  end

  private
  def valid_moves(pos)

  end
end
