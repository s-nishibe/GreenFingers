Blog.create!(
  [
  	{
  	  user_id: 1,
  	  title: 'バラが咲きました！',
  	  content: '',
  	  eyecatch_img: File.open("./app/aseets//.jpg"),
  	  plant_name: 'バラ（赤）'
  	  plant_type: 1,
  	  weather: 1,
  	  temperature: '20.0',
  	  water: true
  	}

    {
      user_id: 2,
      title: 'うちのカーネーションを見て。',
      content: '',
      eyecatch_img: File.open("./app/aseets//.jpg"),
      plant_name: 'カーネーション',
      plant_type: 1,
      weather: 0,
      temperature: '17.5',
      water: true
    }

    {
      user_id: 3,
      title: '人参の種をまく',
      content: '',
      eyecatch_img: File.open("./app/aseets//.jpg"),
      plant_name: '人参',
      plant_type: 0,
      weather: 1,
      temperature:  '18',
      water: true
    }

    {
      user_id: 4,
      title: '今年も咲いたぞ～～～！！',
      content: '',
      eyecatch_img: File.open("./app/aseets//.jpg"),
      plant_name: '梅',
      plant_type: 3,
      weather: 1,
      temperature: '10',
      water: false
    }

    {
      user_id: 6,
      title: '皆さんは見たことありますか？',
      content: '',
      eyecatch_img: File.open("./app/aseets//.jpg"),
      plant_name: 'ブルーベリー',
      plant_type: 2,
      weather: 0,
      temperature: '25.3',
      water: true
    }

    {
      user_id: 7,
      title: 'ばら、難しすぎ問題',
      content: '',
      eyecatch_img: File.open("./app/aseets//.jpg"),
      plant_name:　'ばら',
      plant_type: 1,
      weather: 0,
      temperature: '15.3',
      water: false
    }

    {
      user_id: 8,
      title: 'コーヒーの木を探して花屋をハシゴした日',
      content: '',
      eyecatch_img: File.open("./app/aseets//.jpg"),
      plant_name: 'コーヒーの木',
      plant_type: 3,
      weather: 0,
      temperature: '18.4',
      water: true
    }

    {
      user_id: 8,
      title: 'メロンの種を植えてみたよ！',
      content: '',
      eyecatch_img: File.open("./app/aseets//.jpg"),
      plant_name: 'メロン',
      plant_type: 0,
      weather: 0,
      temperature: '15.7',
      water: true
    }
  ]
)