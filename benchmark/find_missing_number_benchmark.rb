# frozen_string_literal: true

require "benchmark"
require "./lib/find_missing_number"

n = 100_000

# Find the middle number missing for nth=1
arr_n1 = (1..(n + 1)).to_a.tap { |a| a.delete_at(n / 2) }

# Find the last number missing for nth=n
arr_scan = (1..n).to_a

# Find the 50,000th number missing for nth=50,000 in a larger array
nth_scan = 50_000

Benchmark.bm(45) do |bm|
  bm.report("find_missing_number nth=1 (n=#{n}) x100") do
    100.times { find_missing_number(arr_n1) }
  end

  bm.report("find_missing_number nth=#{nth_scan} (n=#{n}) x10") do
    10.times { find_missing_number(arr_scan, nth: nth_scan) }
  end
end
