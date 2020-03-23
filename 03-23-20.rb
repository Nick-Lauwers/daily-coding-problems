# Given an array of integers, return a new array such that each element at 
# index i of the new array is the product of all the numbers in the original 
# array except the one at i.

# For example, if our input was [1, 2, 3, 4, 5], the expected output would 
# be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output 
# would be [2, 3, 6].

# Follow-up: what if you can't use division?

require 'rspec/autorun'

def arr_product(arr)

	result = [1]

	(1...arr.count).each { |i|
		result[i] = result[i-1] * arr[i-1]
	}

	r = 1

	(arr.count-1).downto(0) { |j|
		result[j] *= r
		r *= arr[j]
	}

	result
end

RSpec.describe 'Function' do 

	it 'returns correct result' do
		expect(arr_product([1, 2, 3, 4, 5])).to eq([120, 60, 40, 30, 24])
	end

	it 'does not return incorrect result' do
		expect(arr_product([1, 2, 3, 4, 5])).not_to eq([120, 60, 40, 30, 1])
	end
end