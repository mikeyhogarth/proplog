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

    context "when given an atom" do
      it "should parse it correctly into an atom" do
        unparsed_expression = "foo"
        expression = Expression::Parser.parse(unparsed_expression)
        expect(expression).to be_an Expression::Atom
        expect(expression.value).to eq "foo"
      end
    end

    context "when given a negation" do
      it "should parse it correctly into a negaion" do
        unparsed_expression = "!foo"
        expression = Expression::Parser.parse(unparsed_expression)
        expect(expression).to be_an Expression::Negation
        expect(expression.value).to eq "foo"
      end
    end

    context "when given a complex expression" do
      it "parses it correctly, accounting for priority" do
        unparsed_expression = "p AND q -> !r OR q"
        expression = Expression::Parser.parse(unparsed_expression)
        expect(expression).to be_an Expression::Implication
        expect(expression.left).to be_an Expression::Conjunction
        expect(expression.right).to be_an Expression::Disjunction
      end

      it "prioritises conjunction over disjunction" do
        unparsed_expression = "p & q | h"
        expression = Expression::Parser.parse(unparsed_expression)
        expect(expression).to be_an Expression::Conjunction
        expect(expression.right).to be_an Expression::Disjunction
        expect(expression.left).to be_an Expression::Atom

      end
    end

  end
end
