#
# Proplog::Expression::Parser::ParsableExpressionToken
#
# Responsibility: Model representing a token within a parsable expression.
#
module Proplog
  module Expression
    class  Parser
      private
      class ParsableExpressionToken
        def initialize(value)
          @value = value
        end

        def operator?
          OPERATOR_LOOKUP.keys.include? @value
        end

        def negation?    
          @value =~ NEGATION_OPERATOR_LOOKUP
        end

        def atom?
          !@value.operator? && !@value.negated?
        end

        def to_standardized_operator
          OPERATOR_LOOKUP[@value] if operator?
        end

        def to_negation
          Expression::Negation.new(@value[1..@value.length])
        end

        def to_atom
          Expression::Atom.new(@value)
        end

        private

        OPERATOR_LOOKUP = {
          "&" => :conjunction,
          "&&" => :conjunction,
          "AND" => :conjunction,
          "∧" => :conjunction,
          "|" => :disjunction,
          "||" => :disjunction,
          "OR" => :disjunction,
          "∨" => :disjunction,
          "->" => :implication,
          "→" => :implication
        }

        NEGATION_OPERATOR_LOOKUP = /[¬!]/

      end
    end
  end
end
