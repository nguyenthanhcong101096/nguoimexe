hola  = FactoryBot.create(:user, phone: '0338529346', address: 'aaaa', password: 'password', password_confirmation: 'password')
AdminUser.create!(phone: '0338529345', password: 'password', password_confirmation: 'password') if Rails.env.development?
posts = FactoryBot.create_list(:post, 15, user: hola)

10.times do
  comment = FactoryBot.create_list(:comment, 20, user: hola, post: posts.sample)
end
