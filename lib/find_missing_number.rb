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

DEFAULT_NTH = 1

def find_missing_number(arr, nth: DEFAULT_NTH)
  return nil if arr.empty?

  if nth == 1
    first_missing_number(arr)
  else
    nth_missing_number(arr, nth)
  end
end

private

def first_missing_number(arr)
  return 1 if arr.none? { |x| x == 1 }

  max_val = arr.max
  (1..max_val).sum - arr.sum
end

def nth_missing_number(arr, nth)
  set = arr.to_set
  current = 1
  missing_count = 0

  while missing_count < nth
    unless set.include?(current)
      missing_count += 1
      return current if missing_count == nth
    end

    current += 1
  end
end
