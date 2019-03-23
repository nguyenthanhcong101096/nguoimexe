require_relative 'fixtures/provinces_cities'
require_relative 'fixtures/brand_vehicle_models'

# USER
hola  = FactoryBot.create(:user, email: 'user1@gmail.com', phone: '0338529345', username: 'Nguyễn Thành Công', address: 'aaaa', password: 'password', password_confirmation: 'password')
holo  = FactoryBot.create(:user, email: 'user2@gmail.com', phone: '0338529346', username: 'Thiên Kim', address: 'aaaa', password: 'password', password_confirmation: 'password')
helo  = FactoryBot.create(:user, email: 'nguoimexe@gmail.com', phone: '0338529347', username: 'Người Mê Xê', address: 'aaaa', password: 'password', password_confirmation: 'password')
users = FactoryBot.create_list(:user, 5)

FactoryBot.create(:follow, user: hola, target_user: holo)
FactoryBot.create(:follow, user: holo, target_user: hola)

# posts = FactoryBot.create_list(:post, 20, user: hola, vehicle_kind_id: 1, city_id: 30)
# posts.each do |post|
#   FactoryBot.create_list(:post_image, 5, post_imageable: post)
# end

blog  = FactoryBot.create(:blog, user_id: hola.id, mod: 'motosg', title: 'BLV Quang Huy: ‘Tuyển Việt Nam phải kiên nhẫn nếu muốn hạ Jordan')

#comments_post = 100.times { comment = FactoryBot.create(:comment, user: User.all.sample, commentable: Post.all.sample) }
comments_blog = 50.times { comment = FactoryBot.create(:comment, user: User.all.sample, commentable: blog) }

# CONVERSATIONS
conversation_1  = FactoryBot.create(:conversation, name: 'thien-kim')
conversation_2  = FactoryBot.create(:conversation, name: 'thanh-cong')
conversation_3  = FactoryBot.create(:conversation, name: 'test1')

room_1 = [hola, holo].each { |user| FactoryBot.create(:room_chat, sender_id: user.id, conversation_id: conversation_1.id) }
room_2 = [hola, helo].each { |user| FactoryBot.create(:room_chat, sender_id: user.id, conversation_id: conversation_2.id) }
room_3 = [holo, helo].each { |user| FactoryBot.create(:room_chat, sender_id: user.id, conversation_id: conversation_3.id) }

messages_room_1 = 15.times { FactoryBot.create(:message, conversation_id: conversation_1.id, sender_id: [hola, holo].sample.id) }
messages_room_2 = 15.times { FactoryBot.create(:message, conversation_id: conversation_2.id, sender_id: [hola, helo].sample.id) }
messages_room_3 = 15.times { FactoryBot.create(:message, conversation_id: conversation_3.id, sender_id: [holo, helo].sample.id) }


# ENTERPRISE
enterprise = FactoryBot.create(:enterprise, name: 'Cửa hàng Thành Công', address: '244 Cống Quỳnh, Quận 1', phone: '912819284', user_id: hola.id)

# GROUP
group1      = FactoryBot.create(:group, name: 'motosg', address: 'Quận 1 Hồ Chí Minh', user_id: hola.id)
group2      = FactoryBot.create(:group, name: 'damme', address: 'Quận 1 Hồ Chí Minh', user_id: holo.id)

[hola, holo, helo].map { |u| FactoryBot.create(:user_group, user_id: u.id, group_id: group1.id) }
FactoryBot.create(:user_group, user_id: hola.id, group_id: group2.id)
