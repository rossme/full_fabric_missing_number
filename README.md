# Find the nth missing number
_Write a method that, given an unsorted array of unique integers, finds and returns the nth missing number as if that array formed a sequence, defaulting to the first._

You may need to run `bundle install` to install the required Ruby gems.

### Method Signature

```ruby
def find_missing_number(arr, nth: 1); end
```

To run the method in the console `irb`, execute the following command:

```shell
  require './lib/find_missing_number'
  find_missing_number([1, 2, 3, 4, 6]) #=> 5
```

### Specs

To run the tests, execute the following command in the console:


```shell
  rspec spec/find_missing_number_spec.rb
```

### Benchmarks
The method should be efficient enough to handle very large arrays.
To benchmark the performance, execute the following command in the console:

```shell
  ruby benchmark/missing_number_benchmark.rb
````


### Examples

```ruby
find_missing_number([1, 2, 3, 4, 6]) #=> 5
find_missing_number([1, 2, 3, 4, 6], nth: 2) #=> 7
find_missing_number([2, 3, 4, 6], nth: 23) #=> nil
find_missing_number([1, 2, 3, 4, 5]) #=> nil
find_missing_number([]) #=> nil
```
