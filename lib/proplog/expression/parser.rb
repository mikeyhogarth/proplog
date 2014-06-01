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

      private

      OPERATOR_CLASSES = {
        :conjunction => Expression::Conjunction,
        :disjunction => Expression::Disjunction,
        :implication => Expression::Implication
      }

      OPERATOR_BINDING_PRIORITIES = {
        negation: 3,
        implication: 2,
        conjunction: 1,
        disjunction: 0
      }
    end
  end
  end
