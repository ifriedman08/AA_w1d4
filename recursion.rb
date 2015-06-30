def range(n1, n2)
  if n1 > n2
    return []
  elsif n1 == n2
    [n1]
  else
    [n1].concat(range(n1 + 1, n2))
  end
end

def range(num1,num2)
  return [] if num1 >= num2
  [num1].concat(range(num1+1,num2))
end

def exp(b,n)
  return 1 if n == 0
  b * exp(b, n - 1)
end

def exp2(b,n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
     exp2(b,n/2) * exp2(b,n/2)
  else
    b * exp2(b,(n-1)/2) * exp2(b,(n-1)/2)
  end
 end

class Array

  def deep_dup
    self.map do |el|
      if el.is_a? Array
        el.deep_dup
      else
        el
      end
    end
  end
end

def fib_itr(num)
  result = []
  num.times do |idx|
    if idx <= 1
      result << 1
    else
      result << result[idx - 2] + result[idx - 1]
    end
  end
  result
end

def fib_rec(num)
  if num == 1
    [1]
  elsif num == 2
    [1,1]
  else
    prev = fib_rec(num-1)
    prev << prev[-1] + prev[-2]
    prev
  end
end

def bsearch(array, target)
  len = array.length
  return nil if array.empty? || (array.length == 1 && array[0] != target)
  pivot = len / 2

  case target <=> array[pivot]
  when -1
    new_array = array[0..pivot - 1]
    diff = bsearch(new_array, target)
    pivot - diff  unless diff.nil?
  when 0
    pivot
  when 1
    new_array = array[pivot...len]
    diff = bsearch(new_array, target)
    pivot + diff unless diff.nil?
  end
end

def make_change(amount, coins = [25, 10, 5, 1])
  return [] if amount == 0
  result = []
  coins.each_with_index do |coin, idx|
    if coin == coins.last || (amount - coin).between?(0, coin - coins[idx + 1]) || amount % coin == 0
      result << coin
      amount -= coin
      break
    else
      next
    end
  end
  result << make_change(amount, coins)
  result.flatten.sort.reverse
end

def merge(arr1, arr2)
  result = []
  until arr1.empty? && arr2.empty?
    if arr1.empty?
      result << arr2.shift
    elsif arr2.empty?
        result << arr1.shift
    elsif arr1.first < arr2.first
      result << arr1.shift
    else
      result << arr2.shift
    end
  end
  result
end

def merge_sort(array)
  return array if array.length < 2
  pivot = array.length / 2
  arr1 = array[0...pivot]
  arr2 = array[pivot...array.length]
  merge(merge_sort(arr1),merge_sort(arr2))
end

def subsets(array)
  return [[]] if array.empty?
  old_subs = subsets(array[0..-2])
  new_subs = old_subs.map do |subset|
    subset + [array.last]
  end
  (new_subs + old_subs).sort_by(&:length)
end


# p subsets([1,2,3])

# p make_change(14, [10, 7, 1])
# p make_change(17)
# p bsearch([2, 3, 4, 5], 3)
p bsearch([2, 4, 6, 8, 10], 8) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1],1)
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# p fib_itr(6)
# p fib_rec(12)
#   robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
#
# robot_parts_copy = robot_parts.deep_dup
#
# robot_parts_copy[1] << "LEDs"
#
# p robot_parts[1]

# arr = [1, [2], [3, [4]]]
# b = arr.deep_dup
# b[1] << ["fail"]
# p arr
