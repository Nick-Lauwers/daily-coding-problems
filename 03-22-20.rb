# Given a list of numbers and a number 'k', return whether any two numbers from 
# the list add up to 'k'.

# For example, given [10, 15, 3, 7] and 'k' of 17, return true since 10 + 7 is 
# 17.

# Bonus: Can you do this in one pass?

require 'rspec/autorun'

def sum_to_k?(arr, k)

	compliments = { }

	arr.each { |val| 
		return true if compliments[k-val]
		compliments[val] = true
	}

	false
end

RSpec.describe 'Function' do

	it 'returns true when compliment is present' do
		expect(sum_to_k?([10, 15, 3, 7], 17)).to eq(true)
	end

	it 'returns false when compliment is absent' do
		expect(sum_to_k?([10, 15, 3], 17)).to eq(false)
	end
end