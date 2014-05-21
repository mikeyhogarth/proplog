require "spec_helper"

describe Negation do
  subject { Negation.new("value") }

  describe "#to_s" do
    it "returns the negation in string form" do
      expect(subject.to_s).to eq "¬value"
    end
  end
end
