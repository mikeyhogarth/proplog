#
# Operand
#
# Responsible for figuring out which operand to use based on the class
# name.
#
module Proplog
  module Expression
    module Operand

      OPERANDS = {
        "Proplog::Expression::Conjunction" => "∧",
        "Proplog::Expression::Disjunction" => "∨",
        "Proplog::Expression::Implication" => "→",
        "Proplog::Expression::Negation" => "¬"
      }

      def operand
        OPERANDS[self.class.name]
      end
    end
  end
end
