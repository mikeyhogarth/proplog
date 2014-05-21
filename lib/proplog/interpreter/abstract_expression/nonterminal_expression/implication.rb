class Implication < NonterminalExpression

  def initialize(premise, conclusion)
    @operand = "→"
    super
  end

  def premise
    @left
  end

  def conclusion
    @right
  end

end
