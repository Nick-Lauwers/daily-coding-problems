# You are given an array of non-negative integers that represents a 
# two-dimensional elevation map where each element is unit-width wall and the 
# integer is the height. Suppose it will rain and all spots between two walls 
# get filled up.

# Compute how many units of water remain trapped on the map in O(N) time and 
# O(1) space.

# For example, given the input [2, 1, 2], we can hold 1 unit of water in the 
# middle.

# Given the input [3, 0, 1, 3, 0, 5], we can hold 3 units in the first index, 
# 2 in the second, and 3 in the fourth index (we cannot hold 5 since it would 
# run off to the left), so we can trap 8 units of water.

require 'rspec/autorun'

def volume(arr)

	volume = 0

	left  = 0
	right = arr.count - 1

	max_height_l = arr[left]
	max_height_r = arr[right]

	while left <= right

		if max_height_l <= max_height_r

			if arr[left] < max_height_l
				volume += max_height_l - arr[left]
			else
				max_height_l = arr[left]
			end

			left += 1

		else

			if arr[right] < max_height_r
				volume += max_height_r - arr[right]
			else
				max_height_r = arr[right]
			end

			r -= 1
		end

	end

	volume
end

RSpec.describe 'Function' do 
	it 'returns correct volume given array of heights' do
		expect(volume([3, 0, 1, 3, 0, 5])).to eq(8)
	end
end