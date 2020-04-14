# Given an array of time intervals (start, end) for classroom lectures (possibly overlapping), 
# find the minimum number of rooms required.

# For example, given [(30, 75), (0, 50), (60, 150)], you should return 2.

require 'rspec/autorun'

def min_rooms(schedule)

	starts = [ ]
	ends   = [ ]

	schedule.each { |reservation| 
		starts << reservation[0]
		ends << reservation[1]
	}

	starts.sort!
	ends.sort!

	curr_rooms = 0
	min_rooms  = 0

	s = 0
	e = 0

	while s < starts.count

		if starts[s] < ends[e]
			curr_rooms += 1
			min_rooms = [ min_rooms, curr_rooms ].max
			s += 1

		else
			curr_rooms -= 1
			e += 1
		end
	end

	min_rooms
end

RSpec.describe 'Function' do
	it 'returns correct result when intervals overlap' do
		expect(min_rooms([[30, 75], [0, 50], [60, 150]])).to eq(2)
	end
end