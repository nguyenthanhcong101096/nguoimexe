hola  = FactoryBot.create(:user, phone: '0338529346', address: 'aaaa', password: 'password', password_confirmation: 'password')
users = FactoryBot.create_list(:user, 10)

admin = AdminUser.create!(phone: '0338529345', password: 'password', password_confirmation: 'password') if Rails.env.development?

20.times do
  FactoryBot.create(:post, user: users.sample)
end

200.times do
  comment = FactoryBot.create(:comment, user: users.sample, post: Post.all.sample)
end
