require "spec_helper"

describe Conjunction do
  describe "#to_s" do
    it "returns the conjunction in string form" do
      expression = Conjunction.new("left", "right")
      expect(expression.to_s).to eq "left ∧ right"
    end
  end
end
