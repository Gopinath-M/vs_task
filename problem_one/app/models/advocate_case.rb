class AdvocateCase < ApplicationRecord
	belongs_to :case
	belongs_to :case_status
	belongs_to :advocate ,class_name: "Advocate", foreign_key: "advocate_id"
	belongs_to :assign_laywer ,class_name: "Advocate", foreign_key: "assign_to_id", optional: true
	validate :check_case_state

	after_create :update_block_list
	after_save :update_status


	def update_status
		if self.case_status != CaseStatus.reject_case
			if self.case.case_status != case_status
				self.case.update(case_status_id: case_status.id)
			end
		end
	end

	def update_block_list
		if assign_laywer.present?
			record = assign_laywer.assigned_cases.where.not(id: self.id).where(case_status_id: CaseStatus.practicing_case.id).last
			if record.present?
				self.update(case_status_id: CaseStatus.blocklist_case.id)
			end
		end
	end

	def check_case_state
		p "records = AdvocateCase.where.not(id: id).where(case_id: case_id)"
		p records = AdvocateCase.where.not(id: id).where(case_id: case_id)
		if records.present?
			p 'reject_records = records.where(advocate_id: advocate_id).where(case_status_id: CaseStatus.reject_case.id)'
			p reject_records = records.where(advocate_id: advocate_id).where(case_status_id: CaseStatus.reject_case.id)
			if reject_records.count 
				errors.add("case", "is reject from senior.")
			else
				errors.add("case", "is already picked by someone.")
			end
		else
			unless advocate.practicing_states.collect(&:state_id).include?(self.try(:case).try(:state_id))
				errors.add("state", "not allowed to handle the case.")
			end
		end
	end

end
