# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# admin = Admin.new(
#    email: 'admin@admin',
#    password: '123456'
# )
# admin.save!

admins = [
  {email: 'admin1@example.com', password: '123456'},
  {email: 'admin2@example.com', password: 'passw@rd'},
  {email: 'admin3@example.com', password: 'passw@rd'},
  {email: 'admin4@example.com', password: 'passw@rd'},
  {email: 'admin5@example.com', password: 'passw@rd'},
]

admins.each do |admin|
  # 一度ユーザーをメールアドレスで検索
  admin_data = Admin.find_by(email: admin[:email])
  # 該当ユーザーがいなければ、createする
  if admin_data.nil?
    Admin.create(
      email: admin[:email],
      password: admin[:password]
    )
  end

  User.create!(
    [
      {
        family_name: '山田',
        first_name: '太郎',
        email: 'abcd@example.com',
        password: 'password',
        is_deleted: 0,
        introduction: 'この一ヶ月でプログミングの学習をはじめました！',
        image: File.open('./app/assets/images/example.jpg')
      },
      {
        family_name: '田中',
        first_name: '花子',
        email: '1234@example.com',
        password: 'password',
        is_deleted: 0,
        introduction: 'プログラムの勉強始めて3ヶ月です！',
        image: File.open('./app/assets/images/example.jpg')
      }
    ]
  )

end