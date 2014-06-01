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
        parsable_expression.tokens.each do |token|
          if token.operator?
            resolve_operator token
          else
            resolve_symbol token
          end
        end
      end

      def resolve_operator(part)
         op = part.to_standardized_operator
         shunt! if requires_early_shunting?(op)
         @operator_stack << op 
      end

      def resolve_symbol(part)
         if part.negated?
           @output_stack << part.to_negation
         else
           @output_stack << part.to_atom
         end
      end

      def shunt!
        op      = @operator_stack.pop
        right   = @output_stack.pop
        left    = @output_stack.pop

        case op
        when :conjunction
          @output_stack << Expression::Conjunction.new(left, right)
        when :disjunction
          @output_stack << Expression::Disjunction.new(left, right)
        when :implication
          @output_stack << Expression::Implication.new(left, right)
        end
      end

      def requires_early_shunting?(op)
        return false unless @operator_stack.count > 0
        OPERATOR_BINDING_PRIORITIES[op] > OPERATOR_BINDING_PRIORITIES[@operator_stack.last]
      end

    end
  end
  end
