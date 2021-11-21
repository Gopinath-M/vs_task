class PracticingStatesController < ApplicationController
  def index
  end

  def create
  	@errors = []
  	params[:advocate][:state_id].reject(&:empty?).each do |state|
	  	ps = current_advocate.practicing_states.find_or_initialize_by(state_id: state)
	  	unless ps.save
	  		@errors << ps.errors.full_messages.join(',')
	  	end
	  end
  end

  def destroy
  	@errors = []
  	@practicing_state = current_advocate.practicing_states.find_by(id: params[:id])
  	record = current_advocate.advocate_cases.joins(:case).where(case: {state_id: @practicing_state.state_id}).last if current_advocate.senior_laywer?
  	record = current_advocate.assigned_cases.joins(:case).where(case: {state_id: @practicing_state.state_id}).last if current_advocate.junior_laywer?
  	if record.present?
  		@errors << "Practicing State not able delete. Because particular state have active case"
  	else
  		@practicing_state.destroy
  	end
  end
end
