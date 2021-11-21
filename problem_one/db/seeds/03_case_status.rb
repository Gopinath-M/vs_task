["NEW","PRACTICING","BLOCKLIST","CLOSE","REJECT"].each do |status|
	s = CaseStatus.find_or_create_by(name: status)
	s.update(is_active: true)
end