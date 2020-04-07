# Given an array of integers, find the first missing positive integer 
# in linear time and constant space. In other words, find the lowest 
# positive integer that does not exist in the array. The array can 
# contain duplicates and negative numbers as well.

# For example, the input [3, 4, -1, 1] should give 2. The input [1, 2, 0] 
# should give 3.

# You can modify the input array in-place.

require 'rspec/autorun'

def missing_positive(arr)

	contains = 0
    
  arr.each { |num| 
    if num == 1
      contains += 1
      break
    end
  }
    
  return 1 if contains == 0
    
  arr.each_with_index { |num, index|
    arr[index] = 1 if num <= 0 || arr[index] > arr.count
  }
  
  arr.each { |num| 
    arr[num.abs-1] = -arr[num.abs-1].abs 
  }
  
  arr.each_with_index { |num, index| 
    return index+1 if num > 0
  }
  
  arr.count + 1
end

RSpec.describe 'Function' do

	it 'returns first missing positive within array' do
		expect(missing_positive([3, 4, -1, 1])).to eq(2)
	end

	it 'returns first missing positive outside of array' do
		expect(missing_positive([1, 2, 0])).to eq(3)
	end
end