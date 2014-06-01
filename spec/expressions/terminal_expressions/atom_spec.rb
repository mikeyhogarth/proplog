require "spec_helper"

module Proplog
  describe Expression::Atom do
    subject { Expression::Atom.new("value") }

    describe "#value" do
      it "reutrns the value" do
        expect(subject.value).to eq "value"
      end
    end
  
    describe "#to_s" do
      it "returns the negation in string form" do
        expect(subject.to_s).to eq "value"
      end
    end
  end
end
