module Expression
  class TerminalExpression < AbstractExpression
    attr_reader :value

    def initialize(value)
      @value = value
    end
  
    def to_s
      "#{operand}#{@value}"
    end
  end
end
