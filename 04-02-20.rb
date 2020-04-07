# There exists a staircase with N steps, and you can climb up either 1 or 2 steps at a time. 
# Given N, write a function that returns the number of unique ways you can climb the 
# staircase. The order of the steps matters.

# For example, if N is 4, then there are 5 unique ways:

# 1, 1, 1, 1
# 2, 1, 1
# 1, 2, 1
# 1, 1, 2
# 2, 2

# What if, instead of being able to climb 1 or 2 steps at a time, you could climb any number 
# from a set of positive integers X? For example, if X = {1, 3, 5}, you could climb 1, 3, or 
# 5 steps at a time.

require 'rspec/autorun'

def number_of_ways(n, climbing_combinations)

	steps = { 0 => 1 }

	(1..n).each { |stair|

		steps[stair] ||= 0

		climbing_combinations.each { |combination| 
			steps[stair] += steps[stair - combination] if steps[stair - combination]
		}
	} 

	steps[n]
end

RSpec.describe 'Function' do 

	it 'returns correct result when given two ways to climb the stairs' do
		expect(number_of_ways(4, [1, 2])).to eq(5)
	end

	it 'returns correct result when given three ways to climb the stairs' do
		expect(number_of_ways(5, [1, 3, 5])).to eq(5)
	end
end