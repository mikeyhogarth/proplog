require "spec_helper"

describe Implication do
  subject { Implication.new("left", "right") }

  describe "#to_s" do
    it "returns the conjunction in string form" do
      expect(subject.to_s).to eq "left → right"
    end
  end

  describe "#premise" do
    it "returns the 'left' side of the expression" do
      expect(subject.premise).to eq subject.left
    end
  end

  describe "#conclusion" do
    it "returns the 'right' side of the expression" do
      expect(subject.conclusion).to eq subject.right
    end
  end

end
