module Proplog
  module Expression
    class Implication < NonterminalExpression
      def premise
        @left
      end
    
      def conclusion
        @right
      end
    end
  end
end
