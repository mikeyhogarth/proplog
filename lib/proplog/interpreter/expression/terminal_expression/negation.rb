module Expression
  class Negation < TerminalExpression
    def initialize(value)
      @operand = "¬"
      super
    end
  end
end
