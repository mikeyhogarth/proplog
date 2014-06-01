module Proplog
  module Expression
    class Parser

      def self.parse(str)
        parsable_expression = ParsableExpression.new(str)
        Parser.new.parse(parsable_expression)
      end

      def parse(str)
        perform_parse(str)
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

      def perform_parse(parsable_expression)
        initialize_stacks
        build_stacks(parsable_expression)
        @operator_stack.count.times { shunt! }

        return @output_stack[0]
      end

      def initialize_stacks
        @output_stack    = Array.new
        @operator_stack  = Array.new
      end

      def build_stacks(parsable_expression)
        parsable_expression.each_token do |token|
          parse_token token
        end
      end

      def parse_token(token)
        if token.operator?
          parse_operator token
        else
          parse_symbol token
        end
      end

      def parse_operator(token)
         op = token.to_standardized_operator
         shunt! if requires_early_shunting?(op)
         @operator_stack << op 
      end

      def parse_symbol(token)
         if token.negation?
           @output_stack << token.to_negation
         else
           @output_stack << token.to_atom
         end
      end

      def shunt!
        op      = @operator_stack.pop
        right   = @output_stack.pop
        left    = @output_stack.pop
        @output_stack << OPERATOR_CLASSES[op].new(left,right)
      end

      def requires_early_shunting?(op)
        return false unless @operator_stack.count > 0
        OPERATOR_BINDING_PRIORITIES[op] > OPERATOR_BINDING_PRIORITIES[@operator_stack.last]
      end

    end
  end
  end
