class GgWhatIf < ApplicationRecord
	belongs_to :digitale

	validates :title, presence: true
	validates :title, length: { maximum: 255 }
end
