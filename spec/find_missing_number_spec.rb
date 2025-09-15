require "rspec"
require "./lib/find_missing_number"

describe "find_missing_number" do
  context "when nth is equal to 1" do
    it "returns the missing number in a simple array" do
      expect(find_missing_number([4, 3, 6, 2, 1, 7])).to eq(5)
    end

    it "returns the missing number in a more complex array" do
      array = (1..10000).to_a - [5000]
      expect(find_missing_number(array)).to eq(5000)
    end

    it "returns the missing number when the array contains only 1 integer" do
      expect(find_missing_number([2])).to eq(1)
    end

    it "returns nil for an empty array" do
      expect(find_missing_number([])).to be_nil
    end
  end

  context "when nth is greater than 1" do
    it "returns the nth missing number when it's the largest number" do
      expect(find_missing_number([4, 3, 6, 2, 1, 7, 9], nth: 2)).to eq(8)
    end

    it "returns the nth missing number when it's the smallest number" do
      expect(find_missing_number([4, 3, 6, 2, 1, 7, 9], nth: 3)).to eq(10)
    end

    it "returns the nth missing number when nth is 2" do
      array = (1..10000).to_a - [5000, 7500]
      expect(find_missing_number(array, nth: 2)).to eq(7500)
    end
  end

  context "when nth is 0 or a negative integer" do
    it "returns nil" do
      expect(find_missing_number([1, 2, 3], nth: 0)).to be_nil
      expect(find_missing_number([1, 2, 3], nth: -1)).to be_nil
    end
  end

  context "when nth exceeds the number of missing numbers within the array range" do
    it "returns the nth missing number beyond the current array" do
      expect(find_missing_number([1, 2, 3], nth: 12)).to eq(15)
      expect(find_missing_number([2, 3, 4, 6], nth: 23)).to eq(27)
    end
  end
end
