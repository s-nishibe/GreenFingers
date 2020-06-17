Topic.create!(
 [
 	{
 	 user_id: 2,
  	  title: 'やっぱりプロの庭園は一味違いますね',
  	  category: 5,
  	  status: false
  	},

    {
      user_id: 7,
      title: 'ばらにカビが生えてしましました…',
      category: 4,
      status: false
    },

    {
      user_id: 8,
      title: '京都に行ってきました！',
      category: 5,
      status: true
    },

    {
      user_id: 5,
      title: '皆さんは収穫した果物どうやって食べてますか？',
      category: 5,
      status: true
    },

    {
      user_id: 6,
      title: '観光地の写真上げて旅行した気になろう',
      category: 5,
      status: false
    }

   ]
 )

10.times do |n|
  Topic.create!(
    user_id: 2,
    title: "テスト送信#{n}",
    category: 1,
    status: true,
    )
end