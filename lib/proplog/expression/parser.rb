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

      OPERATOR_LOOKUP = {
        "&" => :conjunction,
        "&&" => :conjunction,
        "AND" => :conjunction,
        "|" => :disjunction,
        "||" => :disjunction,
        "OR" => :disjunction,
        "->" => :implication
      }

      NEGATION_OPERATOR_LOOKUP = /[¬!]/

      def parse_expression(str)
        initialize_stacks
        build_stacks(str)
        @operator_stack.count.times { pop_and_parse }

        return @output_stack[0]
      end

      def initialize_stacks
        @output_stack    = Array.new
        @operator_stack  = Array.new
      end

      def build_stacks(str)
        str.split(" ").each do |item|
          if OPERATOR_LOOKUP.keys.include? item
            @operator_stack << OPERATOR_LOOKUP[item] 
          else
            if item =~ NEGATION_OPERATOR_LOOKUP
              @output_stack << Expression::Negation.new(item)
            else
              @output_stack << Expression::Atom.new(item)
            end
          end
        end
      end

      def pop_and_parse
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
