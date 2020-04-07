# Given the root to a binary tree, implement serialize(root), which serializes 
# the tree into a string, and deserialize(s), which deserializes the string 
# back into the tree.

# For example, given the following Node class

# class Node:
#	def __init__(self, val, left=None, right=None):
#    self.val = val
#    self.left = left
#    self.right = right

#The following test should pass:

# node = Node('root', Node('left', Node('left.left')), Node('right'))
# assert deserialize(serialize(node)).left.left.val == 'left.left'

require 'rspec/autorun'

class TreeNode

	attr_accessor :val, :left, :right

	def initialize(val)
		@val = val
		@left, @right = nil, nil
	end
end

def serialize(root)

	traversal = [ ]

	if root.nil?
		traversal << nil
	else
		traversal << root.val
		traversal += serialize(root.left)
		traversal += serialize(root.right)
	end

	traversal
end

def deserialize(data)

	if data[0].nil?
    return nil
    
  else
    val       = data.shift 
    root      = TreeNode.new(val)
    root.left = deserialize(data)
    data.shift
    root.right = deserialize(data)
  end
  
  root
end