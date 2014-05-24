require "spec_helper"

module Proplog
  describe Expression::TerminalExpression do
    describe "#initialize" do
      context "when passed a non-expression" do
        it "casts it to an Atom before storing" do
          value = "value"

          expression = Expression::TerminalExpression.new(value)

          expect(expression.value).to be_an Expression::Atom
          expect(expression.value.value).to eq value
        end
      end 
    end
  end
end

