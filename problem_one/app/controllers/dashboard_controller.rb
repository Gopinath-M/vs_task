class DashboardController < ApplicationController
  def index
  	@state_id = params[:state_id].present? ? params[:state_id] : current_advocate.filter_state_id
  	@cases = Case.new_cases.where(state_id: @state_id).paginate(page: params[:page], per_page: 10)#.where(state_id: current_advocate.practicing_states.collect(&:state_id))
  end

  def practicing
  	@cases = Case.practicing_cases.where(state_id: current_advocate.practicing_states.collect(&:state_id))
  end
end
