# You are given an M by N matrix consisting of booleans that represents a board. Each True 
# boolean represents a wall. Each False boolean represents a tile you can walk on.

# Given this matrix, a start coordinate, and an end coordinate, return the minimum number of 
# steps required to reach the end coordinate from the start. If there is no possible path, 
# then return null. You can move up, left, down, and right. You cannot move through walls. 
# You cannot wrap around the edges of the board.

# For example, given the following board:

# [[f, f, f, f],
#  [t, t, f, t],
#  [f, f, f, f],
#  [f, f, f, f]]

# and start = (3, 0) (bottom left) and end = (0, 0) (top left), the minimum number of steps 
# required to reach the end is 7, since we would need to go through (1, 2) because there is 
# a wall everywhere else on the second row.

require 'rspec/autorun'

def min_steps(maze, start, destination)

	@min_count = nil

  dfs(maze, start, destination, 0)

  @min_count
end

def dfs(maze, current, destination, count)

	if current[0] >= 0 &&
		 current[1] >= 0 &&
		 current[0] < maze.count &&
		 current[1] < maze.first.count &&
		 maze[current[0]][current[1]] == false

		if current[0] == destination[0] && 
			 current[1] == destination[1] &&
			 ( @min_count.nil? || count < @min_count )
			@min_count = count 
			return
		end

		maze[current[0]][current[1]] = true

		dfs(maze, [ current[0]+1, current[1] ], destination, count+1)
		dfs(maze, [ current[0]-1, current[1] ], destination, count+1)
		dfs(maze, [ current[0], current[1]+1 ], destination, count+1)
		dfs(maze, [ current[0], current[1]-1 ], destination, count+1)

		maze[current[0]][current[1]] = false
	end
end

RSpec.describe 'Function' do
	
	it 'returns correct value when destination is obtainable' do
		expect(min_steps( [ [ false, false, false, false ], 
												[ true, true, false, true ], 
												[ false, false, false, false ], 
												[ false, false, false, false ] ], [ 3, 0 ], [ 0, 0 ] )).to eq(7)
	end

	it 'returns nil value when destination is unobtainable' do
		expect(min_steps( [ [ false, false, false, false ], 
												[ true, true, false, true ], 
												[ false, false, false, false ], 
												[ false, false, false, false ] ], [ 3, 0 ], [ 1, 0 ] )).to eq(nil)
	end
end