module Proplog
  module Expression
    class Parser
      class ParsableExpression
        def initialize(str)
          @parsable_string = str
          SyntaxChecker.check_syntax self
        end

        def parts
          @parts ||= @parsable_string.split(" ").map do |part|
            ParsableExpressionPart.new(part)
          end
        end

        def raw
          @parsable_string
        end
      end
    end
  end
end
