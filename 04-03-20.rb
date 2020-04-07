# Given an integer k and a string s, find the length of the longest substring that contains 
# at most k distinct characters.

# For example, given s = "abcba" and k = 2, the longest substring with k distinct characters 
# is "bcb".

require 'rspec/autorun'

def longest_substring(s, k)

	return "" if k == 0

	substring       = ""
	loc_substring   = ""
	substring_chars = { }

	left  = 0
	right = 0

	while right < s.length

		while substring_chars.size == k && substring_chars[s[right]].nil?
			substring_chars.delete(s[left]) if substring_chars[s[left]] == left
			left += 1
		end

		substring_chars[s[right]] = right

		loc_substring = s[left..right]
		substring     = loc_substring if substring.length <= loc_substring.length

		right += 1
	end

	substring
end

RSpec.describe 'Function' do
	
	it "returns 'bcb' when s = 'abcba', k = 2" do
		expect(longest_substring('abcba', 2)).to eq('bcb') 
	end

	it "returns 'bcb' when s = 'abcba', k = 3" do
		expect(longest_substring('abcba', 3)).to eq('abcba') 
	end
end