module Expression
  class Disjunction < NonterminalExpression

    def initialize(left, right)
      @operand = "∨"
      super
    end

  end
end
