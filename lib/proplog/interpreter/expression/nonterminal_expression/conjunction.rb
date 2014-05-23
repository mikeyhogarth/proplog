module Expression
  class Conjunction < NonterminalExpression

    def initialize(left, right)
      @operand = "∧"
      super
    end
  end
end
