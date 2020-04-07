# Given a list of integers, write a function that returns the largest sum of non-adjacent 
# numbers. Numbers can be 0 or negative.

# For example, [2, 4, 6, 2, 5] should return 13, since we pick 2, 6, and 5. [5, 1, 1, 5] 
# should return 10, since we pick 5 and 5.

# Follow-up: Can you do this in O(N) time and constant space?

require 'rspec/autorun'

def largest_sum(arr)

	prev_max = 0
	curr_max = 0

	arr.each { |num| 
		temp     = curr_max
		curr_max = [ num, num + prev_max, curr_max ].max
		prev_max = temp
	}

	curr_max
end

RSpec.describe 'Function' do 

	it 'returns 13 when arr = [2, 4, 6, 2, 5]' do
		expect(largest_sum([2, 4, 6, 2, 5])).to eq(13)
	end

	it 'returns 10 when arr = [5, 1, 1, 5]' do
		expect(largest_sum([5, 1, 1, 5])).to eq(10)
	end
end