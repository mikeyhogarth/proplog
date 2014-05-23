require "spec_helper"

module Proplog
  describe Expression::Disjunction do
    subject { Expression::Disjunction.new("left", "right") }
  
    describe "#to_s" do
      it "returns the conjunction in string form" do
        expect(subject.to_s).to eq "left ∨ right"
      end
    end
  end
end
