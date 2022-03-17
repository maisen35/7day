# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@admin",
  password: "admin1"
  )
  
User.create!([{
  name: "山本",
  email: "yama@moto",
  password: "takeshi03"
  
}, {
  name: "大沢",
  email: "oo@sawa",
  password: "sawao12"
}, {
  name: "藤木",
  email: "hikyou@janai",
  password: "douse44"
}, {
  name: "永沢",
  email: "tama@negi",
  password: "tamanegi9"
}])

Tweet.create!([{
  user_id: 1,
  tweet: "僕は、元気です。皆さんは、元気ですか？なるほど。元気出しましょう。"
}, {
  user_id: 2,
  tweet: "おなかがすきました。ハンバーグが好きです。"
}, {
  user_id: 3,
  tweet: "嫌なことがありました。"
}, {
  user_id: 4,
  tweet: "ひどいことを言ってしまったな。後悔してます。"
}])