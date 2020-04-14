Draft.create!(
  [
    {
      user_id: 2,
      title: '黄色のバラ',
      content: '',
      eyecatch_img: File.open('./app/assets/images//.jpg'),
      plant_name: 'ミニバラ（黄）',
      plant_type: 1
      weather: 1
      temperature: '25',
      water: true
    }

    {
      user_id: 6
      title: '名前は意外と知られてない',
      content: '',
      eyecatch_img: File.open('./app/assets/images//.jpg'),
      plant_name: '折鶴蘭',
      plant_type: 1
      weather: 0
      temperature: '19.2',
      water:false
    }

    {
      user_id: 6
      title: 'かわいいアイビーちゃん',
      content: '',
      eyecatch_img: File.open('./app/assets/images//.jpg'),
      plant_name: 'アイビー',
      plant_type: 1
      weather: 0
      temperature: '30.5',
      water:false
    }

    {
      user_id: 8
      title: '台風がくるから',
      content: '',
      eyecatch_img: '',
      plant_name: 'コーヒーの木',
      plant_type: 3
      weather: 3
      temperature: '25.7',
      water:true
    }
  ]
)
