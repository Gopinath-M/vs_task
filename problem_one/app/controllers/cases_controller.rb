class CasesController < ApplicationController
  before_action :get_case, only: [:take_case]

  def index
  	if current_advocate.senior_laywer?
	  	@cases = AdvocateCase.where(advocate_id: current_advocate.id)
	  elsif current_advocate.junior_laywer?
	  	@cases = AdvocateCase.where(assign_to_id: current_advocate.id)
	  	# @cases = current_advocate.assigned_cases.where(case_status_id: CaseStatus.try(:practicing_case).try(:id))
	  end
  end

  def take_case
  	@advocate_case = current_advocate.advocate_cases.find_or_initialize_by(case_id: @case.id) if current_advocate.senior_laywer?.present?
  	if current_advocate.junior_laywer?.present?
	  	@advocate_case = current_advocate.assigned_cases.build(case_id: @case.id) 
	  	@advocate_case.advocate_id = current_advocate.honor_id 
	  end
  	@advocate_case.case_status_id = CaseStatus.practicing_case.id
  	@advocate_case.assign_to_id = params[:assign_to_id]
  	@advocate_case.save
  	get_cases
  end

  def show
  	@case = Case.find_by(id: params[:id])
  	@reject_case = current_advocate.advocate_cases.find_by(case_id: @case.id).try(:case_status) == CaseStatus.reject_case
  end

  def close_case
  	@advocate_case =AdvocateCase.find_by(id: params[:case_id])
  	@advocate_case.case_status_id = CaseStatus.close_case.id
  	@advocate_case.save
  end

  def create
  	@errors = []
  	@case = Case.new(case_params)
  	@case.case_status_id = CaseStatus.new_case.try(:id)
  	valid = current_advocate.practicing_states.collect(&:state_id).include?(@case.state_id)
  	if valid.present?
	  	if @case.save
	  		take_case
	  	end
	  else
	  	@errors << "Your not eligible to take or create this state case"
	  end
  end

  def reject_case
  	@case = Case.find_by(id: params[:case_id])
  	@advocate_case = current_advocate.advocate_cases.build(case_id: @case.id)
  	@advocate_case.case_status_id = CaseStatus.reject_case.id
  	@advocate_case.save
  end

  private

  def get_case
  	@case = Case.find_by(id: params[:case_id])
  end

  def get_cases
  	@cases = Case.new_cases.where(state_id: current_advocate.state_id)
  end

  def case_params
  	params.require(:case).permit(:case_no, :name, :description,:state_id)
  end
end
