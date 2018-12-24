hola  = FactoryBot.create(:user, phone: '0338529346', address: 'aaaa', password: 'password', password_confirmation: 'password')
users = FactoryBot.create_list(:user, 10)

admin = AdminUser.create!(phone: '0338529345', password: 'password', password_confirmation: 'password') if Rails.env.development?

posts = FactoryBot.create_list(:post, 15, user: hola)

200.times do
  comment = FactoryBot.create(:comment, user: users.sample, post: posts.sample)
end
