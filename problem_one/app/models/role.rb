class Role < ApplicationRecord
	has_many :advocates
	after_create :update_short_name

	scope :active, -> {where(is_active: true)}

	def update_short_name
		unless short_name.present?
			self.update(short_name: name.to_s.split(" ").map{|m| m.chr }.join('').upcase)
		end
	end

	def self.senior_laywer
		Role.find_by(name: "SENIOR LAWYER")
	end

	def self.junior_laywer
		Role.find_by(name: "JUNIOR LAWYER")
	end
end
