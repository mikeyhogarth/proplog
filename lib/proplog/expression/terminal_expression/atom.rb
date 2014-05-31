module Proplog
  module Expression
    class Atom < TerminalExpression
      def initialize(value)
        @value = value
      end
    end
  end
end

