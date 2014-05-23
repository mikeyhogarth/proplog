
#
# expression_spec.rb
#
# A dumping ground for general expression tests.
#


require "spec_helper"

module Proplog
  describe Expression::AbstractExpression do
    describe "combining expressions" do
      context "when nesting complex expressions" do
        it "works like a charm!" do
          #This test just acts as a "drunk test" of sorts to make sure
          #all the expressions can be combined together.
  
          expr1 = Expression::Conjunction.new "hello", "world"
          expr2 = Expression::Disjunction.new "foo", "bar"
          expr3 = Expression::Implication.new "halo", "whirled"
          expr4 = Expression::Negation.new "foo"
  
          expr5 = Expression::Conjunction.new expr1, expr2
          expr6 = Expression::Disjunction.new expr3, expr4
  
          expect(expr5.to_s).to eq "hello ∧ world ∧ foo ∨ bar"
          expect(expr6.to_s).to eq "halo → whirled ∨ ¬foo"
        end
      end
    end
  end
end
