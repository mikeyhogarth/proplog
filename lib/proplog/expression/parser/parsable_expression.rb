module Proplog
  module Expression
    class Parser
      class ParsableExpression
        def initialize(str)
          @parsable_string = str
          @tokens_accessed = 0
          SyntaxChecker.check_syntax self
        end

        def tokens
          @tokens ||= @parsable_string.split(" ").map do |token|
            ParsableExpressionToken.new(token)
          end
        end

        def each_token
          0.upto(tokens.size-1) do |i|
            yield tokens[i]
          end
        end

        def raw
          @parsable_string
        end
      end
    end
  end
end
