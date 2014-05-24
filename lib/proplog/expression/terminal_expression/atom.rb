module Proplog
  module Expression
    class Atom < TerminalExpression

      #
      # Constructor
      #
      # Unlinke other expressions, the atom's value can be anything
      #
      def initialize(value)
        @value = value
      end
    end
  end
end

