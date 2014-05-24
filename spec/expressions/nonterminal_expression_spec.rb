require "spec_helper"

module Proplog
  describe Expression::NonterminalExpression do

    describe "#initialize" do
      context "when passed two non-expressions" do
        it "casts them to Atom expressions before storing" do
          left_value, right_value = "left", "right"

          expression = Expression::NonterminalExpression.new(left_value, right_value)

          expect(expression.left).to be_an Expression::Atom
          expect(expression.left.value).to eq left_value

          expect(expression.right).to be_an Expression::Atom
          expect(expression.right.value).to eq right_value
        end
      end

    end
  end
end

