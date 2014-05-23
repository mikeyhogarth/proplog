require "spec_helper"

module Proplog
  describe Expression::Atom do
    subject { Expression::Atom.new("value") }
  
    describe "#to_s" do
      it "returns the negation in string form" do
        expect(subject.to_s).to eq "value"
      end
    end
  end
end
