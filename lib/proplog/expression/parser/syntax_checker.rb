module Proplog
  module Expression
    class Parser

      class SyntaxError < StandardError
      end

      class SyntaxChecker

        def self.check_syntax(parsable_expression)
          SyntaxChecker.new.check_syntax(parsable_expression)
        end

        def check_syntax(parsable_expression)
          CHECKS.each do |check|
            raise SyntaxError unless self.send(check, parsable_expression)
          end
        end
         
        private

        CHECKS = [:expression_is_balanced, :expression_does_not_contain_parenthesis]

        def expression_is_balanced(parsable_expression)
          parsable_expression.parts.count.odd?
        end

        def expression_does_not_contain_parenthesis(parsable_expression)
          !(parsable_expression.raw =~ /[\(\)\[\]\{\}]/)
        end

      end
    end
  end
end
