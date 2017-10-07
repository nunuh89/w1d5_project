class PolyTreeNode
  attr_accessor :children, :parent

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def add_child(node)
    if !@children.include?(node)
      @children << node
      node.parent=(self)
    end
  end

  def remove_child(node)
    if @children.include?(node)
      self.remove(node)
      node.parent=(nil)
    else
      raise "Not a child"
    end
  end

  def value
    @value
  end

  def remove(node)
    @children.delete(node)
  end

  def parent=(parent)
    # return nil if parent.nil?
    return if parent == @parent
    old_parent = @parent
    @parent = parent
    if !parent.nil?
      parent.children << self unless parent.children.include?(self)
    end
    old_parent.remove(self) unless old_parent.nil?
  end

  # def count
  #   children.map(&:count).inject(:+)
  # end

  def bfs(target)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target
      queue.concat(current_node.children)
    end
    nil
  end

  def dfs(target)
    return self if self.value == target
    children.each do |child|
      result = child.dfs(target)
      return result if result
    end
    nil
  end
end
