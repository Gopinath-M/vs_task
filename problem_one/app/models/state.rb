class State < ApplicationRecord
	has_many :advocates
	has_many :cases

	scope :active, -> {where(is_active: true)}
end
