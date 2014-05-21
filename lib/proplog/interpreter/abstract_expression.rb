class AbstractExpression

  def operand
    return @operand || "?"
  end
  
end


require "proplog/interpreter/abstract_expression/terminal_expression"

require "proplog/interpreter/abstract_expression/nonterminal_expression"
require "proplog/interpreter/abstract_expression/nonterminal_expression/conjunction"
require "proplog/interpreter/abstract_expression/nonterminal_expression/disjunction"
require "proplog/interpreter/abstract_expression/nonterminal_expression/implication"

