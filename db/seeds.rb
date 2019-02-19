# SEED KIND VEHICLE
VEHICLE_KIND = %i[oto moto bike other]
VEHICLE_KIND.each { |kind| FactoryBot.create(:vehicle_kind, name: kind) }

# SEED USER
hola  = FactoryBot.create(:user, phone: '0338529345', username: 'Nguyễn Thành Công', avatar: Rack::Test::UploadedFile.new(Rails.root.join('app', 'javascript', 'images', 'cong.png'), 'image/png'), address: 'aaaa', password: 'password', password_confirmation: 'password')
holo  = FactoryBot.create(:user, phone: '0338529346', username: 'Thiên Kim', avatar: Rack::Test::UploadedFile.new(Rails.root.join('app', 'javascript', 'images', 'lien.png'), 'image/png'), address: 'aaaa', password: 'password', password_confirmation: 'password')
helo  = FactoryBot.create(:user, phone: '0338529347', username: 'Trung Tâm Nhắn Tin', address: 'aaaa', password: 'password', password_confirmation: 'password')
users = FactoryBot.create_list(:user, 5)

follows = User.all.each { |user| FactoryBot.create(:follow, user: hola, target_user: user) }

posts         = 30.times  { FactoryBot.create(:post, user: User.all.sample, vehicle_kind: VehicleKind.all.sample ) }

img           = Rack::Test::UploadedFile.new(Rails.root.join('app', 'javascript', 'images', 'xe.png'), 'image/png')
blog          = FactoryBot.create(:blog, user_id: hola.id, img: img, kind: 'blog', title: 'BLV Quang Huy: ‘Tuyển Việt Nam phải kiên nhẫn nếu muốn hạ Jordan')

comments_post = 100.times { comment = FactoryBot.create(:comment, user: User.all.sample, commentable: Post.all.sample) }
comments_blog = 50.times { comment = FactoryBot.create(:comment, user: User.all.sample, commentable: blog) }

# SEED CONVERSATIONS
conversations  = FactoryBot.create_list(:conversation, 3)
conversation_1 = [hola, holo].each { |user| FactoryBot.create(:user_chat, user_id: user.id, conversation_id: conversations.first.id) }
conversation_2 = [hola, helo].each { |user| FactoryBot.create(:user_chat, user_id: user.id, conversation_id: conversations.second.id) }
conversation_3 = [holo, helo].each { |user| FactoryBot.create(:user_chat, user_id: user.id, conversation_id: conversations.last.id) }

messages_1 = 15.times { FactoryBot.create(:message, conversation_id: conversations.first.id, user_id: [hola, holo].sample.id) }
messages_2 = 15.times { FactoryBot.create(:message, conversation_id: conversations.second.id, user_id: [hola, helo].sample.id) }
messages_3 = 15.times { FactoryBot.create(:message, conversation_id: conversations.last.id, user_id: [holo, helo].sample.id) }


# SEED ENTERPRISE
enterprise = FactoryBot.create(:enterprise, name: 'Cửa hàng Thành Công', address: '244 Cống Quỳnh, Quận 1', phone: '912819284', user_id: hola.id)
