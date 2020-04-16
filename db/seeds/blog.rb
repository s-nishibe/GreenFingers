Blog.create!(
  [
    {
      user_id: 1,
      title: 'バラが咲きました！',
      content: '<p><span style="font-family: &quot;Comic Sans MS&quot;;"><font color="#a5c6ce">Lorem ipsum</font></span>
      <b style="background-color: rgb(239, 198, 49);">dolor</b>
      <u><font color="#3984c6">sit</font></u>
      <span style="font-family: &quot;Courier New&quot;;">amet</span></p>
      <p><br></p>',
      plant_name: 'バラ（赤）',
      plant_kind: 1,
      weather: 1,
      temperature: '20.0',
      water: true,
      status: true,
      eyecatch_img: File.open("./public/seed_img/rose/red1.jpg")
      },

    {
      user_id: 2,
      title: 'うちのカーネーションを見て。',
      content: '<p><span style="font-family: &quot;Comic Sans MS&quot;;"><font color="#a5c6ce">Lorem ipsum</font></span>
      <b style="background-color: rgb(239, 198, 49);">dolor</b>
      <u><font color="#3984c6">sit</font></u>
      <span style="font-family: &quot;Courier New&quot;;">amet</span></p>
      <p><br></p>',
      plant_name: 'カーネーション',
      plant_kind: 1,
      weather: 0,
      temperature: '17.5',
      water: true,
      status: true,
      eyecatch_img: File.open("./public/seed_img/u_plant/carnation.jpg")
    },

    {
      user_id: 3,
      title: '人参の種をまく',
      content: '<p><span style="font-family: &quot;Comic Sans MS&quot;;"><font color="#a5c6ce">Lorem ipsum</font></span>
      <b style="background-color: rgb(239, 198, 49);">dolor</b>
      <u><font color="#3984c6">sit</font></u>
      <span style="font-family: &quot;Courier New&quot;;">amet</span></p>
      <p><br></p>',
      plant_name: '人参',
      plant_kind: 0,
      weather: 1,
      temperature: '18',
      water: true,
      status: true,
      eyecatch_img: File.open("./public/seed_img/carrot_melon/carrot1.jpg"),
    },

    {
      user_id: 4,
      title: '今年も咲いたぞ～～～！！',
      content: '<p><span style="font-family: &quot;Comic Sans MS&quot;;"><font color="#a5c6ce">Lorem ipsum</font></span>
      <b style="background-color: rgb(239, 198, 49);">dolor</b>
      <u><font color="#3984c6">sit</font></u>
      <span style="font-family: &quot;Courier New&quot;;">amet</span></p>
      <p><br></p>',
      plant_name: '梅',
      plant_kind: 3,
      weather: 1,
      temperature: '10',
      water: false,
      status: true,
      eyecatch_img: File.open("./public/seed_img/u_plant/plum1.jpg")
    },

    {
      user_id: 6,
      title: '皆さんは見たことありますか？',
      content: '<p><span style="font-family: &quot;Comic Sans MS&quot;;"><font color="#a5c6ce">Lorem ipsum</font></span>
      <b style="background-color: rgb(239, 198, 49);">dolor</b>
      <u><font color="#3984c6">sit</font></u>
      <span style="font-family: &quot;Courier New&quot;;">amet</span></p>
      <p><br></p>',
      plant_name: 'ブルーベリー',
      plant_kind: 2,
      weather: 0,
      temperature: '25.3',
      water: true,
      status: true,
      eyecatch_img: File.open("./public/seed_img/u_plant/blueberry1.jpg")
    },

    {
      user_id: 7,
      title: 'ばら、難しすぎ問題',
      content: '<p><span style="font-family: &quot;Comic Sans MS&quot;;"><font color="#a5c6ce">Lorem ipsum</font></span>
      <b style="background-color: rgb(239, 198, 49);">dolor</b>
      <u><font color="#3984c6">sit</font></u>
      <span style="font-family: &quot;Courier New&quot;;">amet</span></p>
      <p><br></p>',
      plant_name: 'ばら',
      plant_kind: 1,
      weather: 0,
      temperature: '15.3',
      water: false,
      status: true,
      eyecatch_img: File.open("./public/seed_img/rose/ry1.jpg")
    },

    {
      user_id: 8,
      title: 'コーヒーの木を探して花屋をハシゴした日',
      content: '<p><span style="font-family: &quot;Comic Sans MS&quot;;"><font color="#a5c6ce">Lorem ipsum</font></span>
      <b style="background-color: rgb(239, 198, 49);">dolor</b>
      <u><font color="#3984c6">sit</font></u>
      <span style="font-family: &quot;Courier New&quot;;">amet</span></p>
      <p><br></p>',
      plant_name: 'コーヒーの木',
      plant_kind: 3,
      weather: 0,
      temperature: '18.4',
      water: true,
      status: true,
      eyecatch_img: File.open("./public/seed_img/u_plant/coffee1.jpg")
    },

    {
      user_id: 8,
      title: 'メロンの種を植えてみたよ！',
      content: '<p><span style="font-family: &quot;Comic Sans MS&quot;;"><font color="#a5c6ce">Lorem ipsum</font></span>
      <b style="background-color: rgb(239, 198, 49);">dolor</b>
      <u><font color="#3984c6">sit</font></u>
      <span style="font-family: &quot;Courier New&quot;;">amet</span></p>
      <p><br></p>',
      plant_name: 'メロン',
      plant_kind: 0,
      weather: 0,
      temperature: '15.7',
      water: true,
      status: true,
      eyecatch_img: File.open("./public/seed_img/carrot_melon/melon1.jpg")
    }
  ]
)
