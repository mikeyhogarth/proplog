# 
# Proplog::Expression::Parser
#
# Responsibility: Parse strings into expression trees.
#
module Proplog
  module Expression
    class Parser

      def self.parse(str)
        Parser.new.parse(str)
      end

      def parse(str)
        parsable_expression = ParsableExpression.new(str)
        shunting_yard = ShuntingYard.new
        shunting_yard.parse(parsable_expression)
      end

    end
  end
  end
