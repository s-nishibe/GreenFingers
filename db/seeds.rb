# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

Blog.create!(
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
    status: true
    )

Plant.create!(
  	user_id: 1,
  	name: 'ミニバラ（赤）',
  	kind: 1,
    memo: '水はたっぷりと。'
    )

Topic.create!(
	user_id: 1,
	title: '熱川に行ってきました！',
	category: 5,
	status: true
	)
