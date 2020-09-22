class Digitale < ApplicationRecord

	belongs_to :creatrix

	has_many :nodes

	def title
		return self.nodes.select { |node| node.nodeable.class.name == "Tale" }[0].title
	end

	def description
		self.nodes[0].content
	end

	def what_if
		return self.nodes.select { |node| node.nodeable.class == WhatIf }[0]
	end

	def m_statements
		return self.nodes.select { |node| node.nodeable.class == MStatement }
	end

end
