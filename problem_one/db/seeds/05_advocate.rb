["Junior","Junior","Junior","Junior","Junior","Junior","Junior"].each.with_index(1) do |name,index|
	email =  "#{name.downcase}-#{index}@yopmail.com"
	advocate = Advocate.find_or_initialize_by(email: email)
	advocate.mobile = "987098709#{index}"
	advocate.full_name = "#{name} #{index}"
	advocate.password = email
	advocate.password_confirmation = email
	advocate.state_id = State.find_by(short_name: "TN").try(:id)
	advocate.experience = index
	advocate.save
end