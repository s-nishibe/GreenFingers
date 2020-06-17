1000.times do |n|
  Topic.seed do |s|
  	s.user_id = 1
  	s.title = "雑談トピその#{n}"
  	s.category = 2
  	s.status = false
  end
end