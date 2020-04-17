# Given a string of round, curly, and square open and closing brackets, return 
# whether the brackets are balanced (well-formed).

# For example, given the string "([])[]({})", you should return true.

# Given the string "([)]" or "((()", you should return false.

require 'rspec/autorun'

def balanced?(brackets)

	stack = [ ]
	bracket_pairs = { '(' => ')', '[' => ']', '{' => '}' }

	brackets.each_char { |bracket| 
		if bracket_pairs[bracket]
			stack << bracket_pairs[bracket]
		else
			return false if stack.pop() != bracket
		end
	}

	stack.empty?
end

RSpec.describe 'Function' do
	
	it 'returns true when brackets are balanced' do
		expect(balanced?("([])[]({})")).to eq(true)
	end

	it 'returns false when brackets are unbalanced' do
		expect(balanced?("([)]")).to eq(false)
	end
end