class Digitale < ApplicationRecord

	belongs_to :creatrix

	has_many :nodes

	def title
		if self.nodes[0].title
			self.nodes[0].title
		else
			"on the rainbow"
		end
		
	end

	def description
		if self.nodes[0].content
			self.nodes[0].content
		else
			"on the rainbow"
		end
	end

	def what_if
		return self.nodes.select { |node| node.nodeable.class == WhatIf }[0]
	end

	def m_statements
		return self.nodes.select { |node| node.nodeable.class == MStatement }
	end

end
