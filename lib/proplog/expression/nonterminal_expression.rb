module Proplog
  module Expression
    class NonterminalExpression < AbstractExpression
      attr_reader :left, :right
    
      def initialize(left, right)
        @left = left
        @right = right
      end
    
      def to_s
        "#{@left.to_s} #{operand} #{@right.to_s}"
      end
    
    end
  end
end
