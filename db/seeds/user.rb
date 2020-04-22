AdminUser.create!(
	id: 1,
	email: 'admin@user',
	password: 'adminuser',
	password_confirmation: 'adminuser'
	)

User.create!(
  [
  	{
	id: 1,
	name: '水嶋流星',
	email: 'mercury@gmail.com',
	introduction: 'クイーンのコンセプトは壮麗さと威厳だ。グラマラスな一面も持ちながら、ダンディでありたい。',
	password: 'mercury',
	password_confirmation: 'mercury'
	},

	{
	id: 2,
	name: '金村七星',
	email: 'venus@gmail.com',
	introduction: '愛の天罰、落とさせて頂きます!',
	password: 'venusvenus',
	password_confirmation: 'venusvenus'
	},

	{
	id: 3,
	name: '琉球大地',
	email: 'earth@gmail.com',
	introduction: 'あした、何着て生きていく？',
	password: 'earthearth',
	password_confirmation: 'earthearth'
	},

	{
	id: 4,
	name: '星井直木',
	email: 'jupiter@gmail.com',
	introduction: '俺のパフォーマンス、見せてやるぜっ！',
	password: 'jupiter',
	password_confirmation: 'jupiter'
	},

	{
	id: 5,
	name: '土屋一星',
	email: 'saturn@gmail.com',
	introduction: '友情とやらを感じた時もあったやも知れぬ。だが友情も命と同じ。時が立てば消え失せるはかない幻よ。',
	password: 'saturn',
	password_confirmation: 'saturn'
	},

	{
	id: 6,
	name: '星沢天音',
	email: 'uranus@gmail.com',
	introduction: 'どうしたんだ、ハリー？NASAが天王星で油田を発見したか？',
	password: 'uranus',
	password_confirmation: 'uranus'
	},

	{
	id: 7,
	name: '成海星弥',
	email: 'neptune@gmail.com',
	introduction: '何の慈愛か……我々もまた当然という顔をして……、太陽の恵みに生かされておるんじゃもん!!',
	password: 'neptune',
	password_confirmation: 'neptune'
	},

	{id: 8,
	name: '星乃谷メイ',
	email: 'pluto@gmail.com',
	introduction: '間違う頭脳こそが完ぺきなんだ。',
	password: 'plutopluto',
	password_confirmation: 'plutopluto'
    }

  ]
)