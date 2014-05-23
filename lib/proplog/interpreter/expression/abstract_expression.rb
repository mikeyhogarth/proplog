module Expression
  class AbstractExpression
    def initialize
      raise StandardError, "You can not instantiate an abstract expression"
    end

    def operand
      return @operand || "?"
    end 
  end
end

