class CaseStatus < ApplicationRecord
	has_many :adovcate_cases
	after_create :update_short_name

	def update_short_name
		unless short_name.present?
			self.update(short_name: name.to_s.split(" ").map{|m| m.chr }.join('').upcase)
		end
	end

	def self.new_case
		CaseStatus.where(name: "NEW").last
	end

	def self.practicing_case
		CaseStatus.where(name: "PRACTICING").last
	end

	def self.blocklist_case
		CaseStatus.where(name: "BLOCKLIST").last
	end

	def self.reject_case
		CaseStatus.where(name: "REJECT").last
	end

	def self.close_case
		CaseStatus.where(name: "CLOSE").last
	end


	def practicing_case?
		self.name == "PRACTICING"
	end
end
