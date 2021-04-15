class Digitale < ApplicationRecord

	validates :title, presence: true
	validates :title, length: { maximum: 30 }

	belongs_to :creatrix

	has_one :gg_what_if

	has_many :gg_m_statements

	
	has_many :nodes

	#def title
	#	return self.nodes[0].title
	#end

	#def description
	#	self.nodes[0].content
	#end

	#def what_if
	#	return self.nodes.select { |node| node.nodeable.class == WhatIf }[0]
	#end

	#def m_statements
	#	return self.nodes.select { |node| node.nodeable.class == MStatement }
	#end

end
