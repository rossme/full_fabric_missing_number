# frozen_string_literal: true
#
# find_missing_number(arr, nth: 1) → Integer or nil
#
# Returns the nth positive integer missing from arr.
# • When nth == 1, uses Gauss’ sum n(n+1)/2 for O(n) time.
#     -> see https://rubydoc.info/stdlib/core/Enumerable:sum
# • For nth > 1, builds a Set and counts gaps in O(nth).
#
# Examples:
#   find_missing_number([1,2,4])          #=> 3
#   find_missing_number([1,2,4], nth: 2)  #=> 5
#
require "set"

def find_missing_number(arr, nth: 1)
  return nil if arr.empty? || nth < 1

  arr_max = arr.max

  if nth == 1
    return (1..arr_max).sum - arr.sum
  end

  set = arr.to_set

  current = 1
  missing_count = 0

  while missing_count < nth
    return nil if nth > arr.size + 1 && current > arr_max

    unless set.include?(current)
      missing_count += 1
      return current if missing_count == nth
    end

    current += 1
  end
end
