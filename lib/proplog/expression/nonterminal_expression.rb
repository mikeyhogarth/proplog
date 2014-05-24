module Proplog
  module Expression
    class NonterminalExpression < AbstractExpression
      attr_reader :left, :right
    
      #
      # Constructor
      #
      # Left and Right will either be expressions, or will be cast
      # to expressions (Atoms)
      #
      def initialize(left, right)
        @left = left.kind_of?(AbstractExpression) ? left : Atom.new(left)
        @right = right.kind_of?(AbstractExpression) ? right : Atom.new(right)
      end
    
      def to_s
        "#{@left.to_s} #{operand} #{@right.to_s}"
      end
    
    end
  end
end
