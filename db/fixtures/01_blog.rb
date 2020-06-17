1000.times do |n|
  Blog.seed do |s|
  	s.user_id = 1
  	s.plant_id = 1
  	s.title = "花を観察してみた　#{n}日目"
  	s.body = "<p>#{n}日連続更新だ！　花は今日も元気です。</p>"
  	s.status = true
  end
end