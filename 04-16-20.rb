# Given a singly linked list and an integer k, remove the kth last element from 
# the list. k is guaranteed to be smaller than the length of the list.

# The list is very long, so making more than one pass is prohibitively 
# expensive.

# Do this in constant space and in one pass.

def remove(head, k)

	dummy 		 = ListNode.new(nil)
	dummy.next = head

	tail_a = tail_b = dummy

	(k+1).times do
		tail_a = tail_a.next
	end

	while tail_a
		tail_a = tail_a.next
		tail_b = tail_b.next
	end

	tail_b.next = tail_b.next.next

	dummy.next
end