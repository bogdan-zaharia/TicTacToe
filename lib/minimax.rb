class Minimax
  def self.best_move(tree)
    return nil if tree.empty?
    result = tree[0]
    tree.each do |node|
      node[:score] += score_of(node[:children])
      result = node if node[:score] > result[:score]
    end
    result[:position]
  end
  private
  def self.score_of(children, max = false)
    return 0 if children.empty?
    if max
      child_score = children.map do |child|
        score_of(child[:children], !max)
      end.max
    else
      child_score = children.map do |child|
        score_of(child[:children], !max)
      end.min
    end
    child_score - 1 + min_or_max(children, max)
  end
  def self.min_or_max(children, max)
    if max
      children.max_by { |c| c[:score] }[:score]
    else
      children.min_by { |c| c[:score] }[:score]
    end
  end

end