AdminUser.create!(
	id: 1,
	email: 'admin@user',
	password: 'adminuser',
	password_confirmation: 'adminuser'
	) if Rails.env.development?

User.create!(
  [
  	{
	id: 1,
	name: '水嶋流星',
	email: 'mercury@gmail.com',
	profile_img: File.open('./app/assets/images/profile_img/mercury.jpg'),
	introduction: 'クイーンのコンセプトは壮麗さと威厳だ。グラマラスな一面も持ちながら、ダンディでありたい。',
	password: 'mercury',
	password_confirmation: 'mercury'
	},

	{
	id: 2,
	name: '金渕七星',
	email: 'venus@gmail.com',
	introduction: '愛の天罰、落とさせて頂きます!',
	profile_img: File.open('./app/assets/images/profile_img/venus.jpg'),
	password: 'venusvenus',
	password_confirmation: 'venusvenus'
	},

	{
	id: 3,
	name: '琉球大地',
	email: 'earth@gmail.com',
	introduction: 'あした、何着て生きていく？',
	profile_img: File.open('./app/assets/images/profile_img/earth.jpg'),
	password: 'earthearth',
	password_confirmation: 'earthearth'

	{
	id: 4,
	name: '星井直木',
	email: 'jupiter@gmail.com',
	introduction: '俺のパフォーマンス、見せてやるぜっ！',
	profile_img: File.open('./app/assets/images/profile_img/jupiter.jpg'),
	password: 'jupiter',
	password_confirmation: 'jupiter'
	},

	{
	id: 5,
	name: '土屋一星',
	email: 'saturn@gmail.com',
	introduction: '友情とやらを感じた時もあったやも知れぬ。だが友情も命と同じ。時が立てば消え失せる儚い幻よ。',
	profile_img: File.open('./app/assets/images/profile_img/saturn.jpg'),
	password: 'saturn',
	password_confirmation: 'saturn'
	},

	{
	id: 6,
	name: '星沢天音',
	email: 'uranus@gmail.com',
	introduction: 'どうしたんだ、ハリー？NASAが天王星で油田を発見したか？',
	profile_img: File.open('./app/assets/images/profile_img/uranus.jpg'),
	password: 'uranus',
	password_confirmation: 'uranus'
	},

	{
	id: 7,
	name: '成海星弥',
	email: 'neptune@gmail.com',
	introduction: '何の慈愛か……我々もまた当然という顔をして……、太陽の恵みに生かされておるんじゃもん!!',
	profile_img: File.open('./app/assets/images/profile_img/neptune.jpg'),
	password: 'neptune',
	password_confirmation: 'neptune'
	},

	{
	id: 8,
	name: '星乃谷メイ',
	email: 'pluto@gmail.com',
	introduction: '間違う頭脳こそが完璧なんだ。',
	password: 'plutopluto',
	password_confirmation: 'plutopluto'
	}
  ]
 )