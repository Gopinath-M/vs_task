["SENIOR LAWYER","JUNIOR LAWYER"].each do |role|
	r = Role.find_or_create_by(name: role)
	r.update(is_active: true)
end