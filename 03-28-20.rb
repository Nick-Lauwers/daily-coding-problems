# Given the mapping a = 1, b = 2, ... z = 26, and an encoded message, count the 
# number of ways it can be decoded.

# For example, the message '111' would give 3, since it could be decoded as 
# 'aaa', 'ka', and 'ak'.

# You can assume that the messages are decodable. For example, '001' is not 
# allowed.

require 'rspec/autorun'

def encoding(message)

	return 0 if message.empty?

	dp = Array.new(message.length+1, 0)

	dp[0] = 1
	dp[1] = message[0] == '0' ? 0 : 1

	(2..message.length).each { |i| 
		dp[i] +=  dp[i-1] if message[i-1].between?('1', '9')
		dp[i] +=  dp[i-2] if message[i-2...i].between?('10', '26')
	}

	dp[message.length]
end

RSpec.describe 'Function' do 

	it 'returns correct result when there are no leading zeroes' do
		expect(encoding('111')).to eq(3)
	end

	it 'returns correct result when there are leading zeroes' do
		expect(encoding('001')).to eq(0)
	end
end