module Proplog
  module Expression
    class  Parser
      class ParsableExpressionPart
        def initialize(value)
          @value = value
        end

        def operator?
          OPERATOR_LOOKUP.keys.include? @value
        end

        def negated?    
          @value =~ NEGATION_OPERATOR_LOOKUP
        end

        def atom?
          !@value.operator? && !@value.negated?
        end

        def to_standardized_operator
          OPERATOR_LOOKUP[@value] if operator?
        end

        def to_negation
          Expression::Negation.new(@value)
        end

        def to_atom
          Expression::Atom.new(@value)
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

      end
    end
  end
end
