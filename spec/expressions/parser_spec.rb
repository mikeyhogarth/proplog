require "spec_helper"

module Proplog
  describe Expression::Parser do

    context "when given a conjunction" do
      it "should parse it correctly into a conjunction" do
        unparsed_expression = "hello & world"
        expression = Expression::Parser.parse(unparsed_expression)
        expect(expression).to be_an Expression::Conjunction
        expect(expression.left).to be_an Expression::Atom
        expect(expression.right).to be_an Expression::Atom
        expect(expression.left.value).to eq "hello"
        expect(expression.right.value).to eq "world"
      end
    end

    context "when given a disjunction" do
      it "should parse it correctly into a disjunction" do
        unparsed_expression = "hello | world"
        expression = Expression::Parser.parse(unparsed_expression)
        expect(expression).to be_an Expression::Disjunction
        expect(expression.left).to be_an Expression::Atom
        expect(expression.right).to be_an Expression::Atom
        expect(expression.left.value).to eq "hello"
        expect(expression.right.value).to eq "world"
      end
    end

  end
end
