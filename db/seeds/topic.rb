Topic.create!(
  [
  	{
  	  user_id: 1,
  	  title: 'やっぱりプロの庭園は一味違いますね',
  	  eyecatch_img: File.open(''),
  	  category: 5,
  	  status: false
  	}

    {
      user_id: 7,
      title: 'ばらにカビが生えてしましました…',
      eyecatch_img: File.open(''),
      category: 4,
      status: false
    }

    {
      user_id: 8,
      title: '京都に行ってきました！',
      eyecatch_img: File.open(''),
      category: 5,
      status: true
    }

    {
      user_id: 5,
      title: '皆さんは収穫した果物どうやって食べてますか？',
      eyecatch_img: File.open(''),
      category: 5,
      status: true
    }
  ]
)


# category
# 0育て方全般
# 1剪定
# 2土作り
# 3肥料
# 4病害虫
# 5その他