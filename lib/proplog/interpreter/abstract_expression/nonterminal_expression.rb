class NonterminalExpression < AbstractExpression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def to_s
    "#{@left.to_s} #{operand} #{@right.to_s}"
  end

  def operand
    "?"
  end
end

