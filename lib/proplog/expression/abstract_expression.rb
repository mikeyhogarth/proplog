module Proplog
  module Expression
    class AbstractExpression
      include Proplog::Expression::Operand

      def initialize
        raise StandardError, "You can not instantiate an abstract expression"
      end
    end
  end
end
