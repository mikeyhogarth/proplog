module Proplog
  module Expression
    class TerminalExpression < AbstractExpression
      attr_reader :value

      #
      # Constructor
      #
      # Value will either be an expressions, or will be cast
      # to an expression (Atoms)
      #
      def initialize(value)
        @value = value.kind_of?(AbstractExpression) ? value : Atom.new(value)
      end
    
      def to_s
        "#{operand}#{@value}"
      end
    end
  end
end
