require "spec_helper"

module Proplog
  describe Expression::Parser do

    context "when given a conjunction" do
      it "should parse it correctly into a conjunction" do
        unparsed_expression = "hello & world"
        expression = Expression::Parser.parse(unparsed_expression)
        expect(expression).to be_an Expression::Conjunction
      end
    end

    context "when given a disjunction" do
      it "should parse it correctly into a disjunction" do
        unparsed_expression = "hello | world"
        expression = Expression::Parser.parse(unparsed_expression)
        expect(expression).to be_an Expression::Disjunction
      end
    end

    context "when given an implication" do
      it "should parse it correctly into an implication" do
        unparsed_expression = "hello -> world"
        expression = Expression::Parser.parse(unparsed_expression)
        expect(expression).to be_an Expression::Implication
      end
    end

  end
end
