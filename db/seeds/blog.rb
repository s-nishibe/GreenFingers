1000.times do |n|
  Blog.create!(
  	user_id: 8,
  	plant_id: 9,
  	title: "今日の日記#{n}",
  	body: "<p>N+1問題の改善#{n}</p>",
   	)
end