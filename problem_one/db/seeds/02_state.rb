CS.states("IN").each do |key,value|
	s = State.find_or_create_by(short_name: key.to_s)
	s.update(name: value,is_active: true)
end