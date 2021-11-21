class Advocate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role,optional: true
  belongs_to :honor ,optional: true, class_name: "Advocate", foreign_key: "honor_id"
  has_many :advocate_cases, class_name: "AdvocateCase", foreign_key: "advocate_id"
  has_many :assigned_cases, class_name: "AdvocateCase", foreign_key: "assign_to_id"
  has_many :assitants, class_name: "Advocate", foreign_key: "honor_id"
  has_many :practicing_states

  scope :seniors, -> {where(role_id: Role.senior_laywer.id)}
  scope :juniors, -> {where(role_id: Role.junior_laywer.id)}
  scope :new_advocates, -> {juniors.where(honor_id: nil)}

  before_save :update_role

  def update_role
  	select_role = experience.to_i > 5 ? Role.senior_laywer : Role.junior_laywer
		unless role.present?
			self.role_id = select_role.try(:id)
		end
  end

  def senior_laywer?
  	role == Role.senior_laywer
  end

  def junior_laywer?
  	role == Role.junior_laywer
  end

  def case_assign_to
  	[self] + assitants 
  end

  def filter_state_id
  	practicing_states.count > 0 ? practicing_states.last.state_id : (honor.present? ? honor.filter_state_id : State.first.id)
  end

end
