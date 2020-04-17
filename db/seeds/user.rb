AdminUser.create!(
	id: 1,
	email: 'admin@user',
	password: 'adminuser',
	password_confirmation: 'adminuser'
	)

User.create!(
	id: 1,
	name: '水嶋流星',
	email: 'mercury@gmail.com',
	introduction: 'クイーンのコンセプトは壮麗さと威厳だ。グラマラスな一面も持ちながら、ダンディでありたい。',
	password: 'mercury',
	password_confirmation: 'mercury'
	)