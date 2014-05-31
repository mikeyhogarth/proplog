module Proplog
  module Expression
    class Parser

      def self.parse(str)
        parser = Parser.new
        parsable_expression = ParsableExpression.new(str)
        return parser.parse(parsable_expression)
      end

      def parse(str)
        perform_parse(str)
      end


      private

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
        parsable_expression.parts.each do |part|
          if part.operator?
            @operator_stack << part.to_standardized_operator 
          else
            if part.negated?
              @output_stack << part.to_negation
            else
              @output_stack << part.to_atom
            end
          end
        end
      end

      def shunt!
        #pop
        op      = @operator_stack.pop
        right   = @output_stack.pop
        left    = @output_stack.pop

        #and parse
        case op
        when :conjunction
          @output_stack << Expression::Conjunction.new(left, right)
        when :disjunction
          @output_stack << Expression::Disjunction.new(left, right)
        when :implication
          @output_stack << Expression::Implication.new(left, right)
        end
      end

    end
  end
  end
