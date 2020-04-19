# Run-length encoding is a fast and simple method of encoding strings. The basic 
# idea is to represent repeated successive characters as a single count and 
# character. For example, the string "AAAABBBCCDAA" would be encoded as 
# "4A3B2C1D2A".

# Implement run-length encoding and decoding. You can assume that the string to 
# be encoded has no digits and consists solely of alphabetic characters. You can 
# assume the string to be decoded is valid, as well.

require 'rspec/autorun'

def encode(string)

	return "" if string.empty?

	encoded_string = ""
	prev_char      = string[0]
	count 				 = 1

	(1...string.length).each { |i|

		if string[i] == prev_char
			count += 1
		else
			encoded_string << "#{count}#{prev_char}"
			prev_char = string[i]
			count     = 1
		end
	}

	encoded_string << "#{count}#{prev_char}"
end

def decode(string)

	decoded_string = ""
	char_count     = ""

	string.each_char { |char| 
		if char =~ /\d/
			char_count << char
		else
			decoded_string << ( char * char_count.to_i )
			char_count = ""
		end
	}

	decoded_string
end

RSpec.describe 'Function' do
	it 'correctly returns the encoded version of a decoded string' do
		expect(encode(decode("4A3B2C1D2A"))).to eq("4A3B2C1D2A")
	end
end