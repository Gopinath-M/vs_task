class AdvocatesController < ApplicationController
  def index
  	@advocates = Advocate.new_advocates.where.not(id: current_advocate.try(:id))
  end

  def assitants
  	@advocates = current_advocate.assitants
  end

  def make_assitant
  	@advocate = Advocate.find_by(id: params[:advocate_id])
  	@advocate.honor_id = current_advocate.id
  	@advocate.save
  	@advocates = Advocate.new_advocates.where.not(id: current_advocate.try(:id))
  end

  def remove_assitant
  	@advocate = Advocate.find_by(id: params[:advocate_id])
  	@advocate.honor_id = nil
  	@advocate.save
  	@advocate.assigned_cases.where(advocate_id: current_advocate.id).update_all(assign_to_id: current_advocate.id)
  	@advocates = Advocate.new_advocates.where.not(id: current_advocate.try(:id))
  end

  def new_assitant
  	
  end

  def add_assitant
  	@advocate = Advocate.new(advocate_params)
  	@advocate.state_id = current_advocate.state_id
  	@advocate.honor_id = current_advocate.id
  	@advocate.password = @advocate.email
  	@advocate.password_confirmation = @advocate.email
  	@advocate.save
  	redirect_to assitants_advocates_path
  end

  private

  def advocate_params
  	params.require(:advocate).permit(:full_name, :mobile, :email, :role_id, :state_id, :experience, :password, :password_confirmation)
  end
end
