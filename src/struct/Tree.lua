-- Define the TreeNode class
local TreeNode = {}
TreeNode.__index = TreeNode

function TreeNode.new(val)
	local node = {}
	setmetatable(node, TreeNode)

	node.val = val
	node.left = nil
	node.right = nil

	return node
end

-- Define the Tree class
local Tree = {}
Tree.__index = Tree

function Tree.new()
	local tree = {}
	setmetatable(tree, Tree)
	tree.root = nil
	return tree
end

function Tree:insert(val)
	if self.root == nil then
		self.root = TreeNode.new(val)
	else
		self:_insert(val, self.root)
	end
end

function Tree:_insert(val, node)
	if val < node.val then
		if node.left == nil then
			node.left = TreeNode.new(val)
		else
			self:_insert(val, node.left)
		end
	else
		if node.right == nil then
			node.right = TreeNode.new(val)
		else
			self:_insert(val, node.right)
		end
	end
end

function Tree:preorder()
	self:_preorder(self.root)
end

function Tree:_preorder(node)
	if node ~= nil then
		print(node.val)
		self:_preorder(node.left)
		self:_preorder(node.right)
	end
end

function Tree:inorder()
	self:_inorder(self.root)
end

function Tree:_inorder(node)
	if node ~= nil then
		self:_inorder(node.left)
		print(node.val)
		self:_inorder(node.right)
	end
end

function Tree:postorder()
	self:_postorder(self.root)
end

function Tree:_postorder(node)
	if node ~= nil then
		self:_postorder(node.left)
		self:_postorder(node.right)
		print(node.val)
	end
end

function Tree:print()
	local function printNode(node, level, lable)
		if node then
			printNode(node.right, level + 1, "right node of the " .. lable)
			print(("\t"):rep(level) .. lable .. " " .. tostring(node.val or ""))
			printNode(node.left, level + 1, "left node of the " .. lable)
		end
	end
	printNode(self.root, 0, "root")
end

return Tree
