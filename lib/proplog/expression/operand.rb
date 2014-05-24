#
# Operand
#
# Responsible for figuring out which operand to use based on the class
# name.
#
module Proplog
  module Expression
    module Operand

      #
      # operand
      #
      # Available as an instance method. Consults the internal hash
      # to establish which operand should be used for this class.
      #
      def operand
        OPERANDS[self.class.name]
      end
      
      private

      #
      # In the unlikely event that a new operand is introduced into
      # propositional calculus, add it here along with a terminal or non-terminal
      # class in the appropriate folder.
      #
      OPERANDS = {
        "Proplog::Expression::Conjunction" => "∧",
        "Proplog::Expression::Disjunction" => "∨",
        "Proplog::Expression::Implication" => "→",
        "Proplog::Expression::Negation" => "¬"
      }

    end
  end
end
