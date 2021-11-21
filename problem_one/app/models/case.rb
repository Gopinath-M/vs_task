class Case < ApplicationRecord
	belongs_to :state
	belongs_to :case_status
	has_many :advocate_cases
	after_create :update_new_case
	scope :new_cases, -> {where(case_status_id: CaseStatus.new_case.id)}
	scope :practicing_cases, -> {where(case_status_id: CaseStatus.practicing_case.id)}

	def update_new_case
		unless case_status_id.present?
			self.case_status_id = CaseStatus.new_case.id
			self.save
		end
	end
end
