module Proplog
  module Expression
    class Parser

      def self.parse(str)
        parser = Parser.new
        return parser.parse(str)
      end

      def parse(str)
        parse_expression(str)
      end

      private

      OPERATORS = {
        "&" => :conjunction,
        "|" => :disjunction
      }

      def parse_expression(str)
        initialize_stacks
        build_stacks(str)
        finalize_stacks
        return @output_stack[0]
      end

      def initialize_stacks
        @output_stack    = Array.new
        @operator_stack  = Array.new
      end

      def build_stacks(str)
        str.split(" ").each do |item|
          if OPERATORS.keys.include? item
            @operator_stack << OPERATORS[item] 
          else
            @output_stack << Expression::Atom.new(item)
          end
        end
      end

      def finalize_stacks
        @operator_stack.count.times do
          op      = @operator_stack.pop
          right   = @output_stack.pop
          left    = @output_stack.pop
          perform_parsing(op, left, right)
        end
      end

      def perform_parsing(op, left, right)
        case op
        when :conjunction
          @output_stack << Expression::Conjunction.new(left, right)
        when :disjunction
          @output_stack << Expression::Disjunction.new(left, right)
        end
      end

    end
  end
end
