class PracticingState < ApplicationRecord
	belongs_to :advocate
	belongs_to :state
	validate :check_state_process

	def check_state_process
		if advocate.junior_laywer?
			if advocate.honor.present?
				unless advocate.honor.practicing_states.collect(&:state_id).include?(state_id)
					errors.add("practicing_states", "is not actived by your senior")
				end
			else
				errors.add("You", "need to join with any senior.")
			end
		end
	end
end
