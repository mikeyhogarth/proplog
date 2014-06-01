#
# Proplog::Expression::Parser::ParsableExpression
#
# Responsibility: Model representing a parsable expression. 
#
module Proplog
  module Expression
    class Parser
      private
      class ParsableExpression
        def initialize(str)
          @parsable_string = str
          SyntaxChecker.check_syntax self
        end

        def raw
          @parsable_string
        end

        def tokens
          @tokens ||= split_parsable_string_into_tokens
        end

        def token_count
          tokens.count
        end

        def each_token
          0.upto(tokens.size-1) do |i|
            yield tokens[i]
          end
        end

        private
        def split_parsable_string_into_tokens
          token_list = []

          @parsable_string.split(/\s+/).each do |token|
            new_token = ParsableExpressionToken.new(token)
            if !new_token.operator? && (token_list.last && !token_list.last.operator?)
              token_list.last.concat new_token
            else
              token_list << new_token
            end
          end

          return token_list
        end

      end
    end
  end
end
