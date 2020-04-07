# You run an e-commerce website and want to record the last N order ids in a log. Implement 
# a data structure to accomplish this, with the following API:

# record(order_id): adds the order_id to the log
# get_last(i): gets the ith last element from the log. i is guaranteed to be smaller than 
# or equal to N.

# You should be as efficient with time and space as possible.

class Log

	def initialize(n)
		@log        = Array.new
		@max_count  = n
		@curr_count = 0
	end

	def record(order_id)
		@curr_count == @max_count ? @log = @log[1..-1] : @curr_count += 1
		@log << order_id
	end

	def get_last(i)
		@log[-i]
	end
end