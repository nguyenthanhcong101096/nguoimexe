# SEED KIND VEHICLE
VEHICLE_KIND = %i[oto moto bike other]
VEHICLE_KIND.each { |kind| FactoryBot.create(:vehicle_kind, name: kind) }

# SEED USER
hola  = FactoryBot.create(:user, phone: '0338529345', username: 'Nguyễn Thành Công', avatar: Rack::Test::UploadedFile.new(Rails.root.join('app', 'javascript', 'images', 'cong.png'), 'image/png'), address: 'aaaa', password: 'password', password_confirmation: 'password')
holo  = FactoryBot.create(:user, phone: '0338529346', username: 'Thiên Kim', avatar: Rack::Test::UploadedFile.new(Rails.root.join('app', 'javascript', 'images', 'lien.png'), 'image/png'), address: 'aaaa', password: 'password', password_confirmation: 'password')
helo  = FactoryBot.create(:user, phone: '0338529347', username: 'Trung Tâm Nhắn Tin', address: 'aaaa', password: 'password', password_confirmation: 'password')
users = FactoryBot.create_list(:user, 5)

follows = User.all.each { |user| FactoryBot.create(:follow, user: hola, target_user: user) }

30.times  { FactoryBot.create(:post, user: User.all.sample, vehicle_kind: VehicleKind.all.sample ) }
200.times { comment = FactoryBot.create(:comment, user: User.all.sample, post: Post.all.sample) }

# SEED CONVERSATIONS
conversations = FactoryBot.create_list(:conversation, 3)
conversation_1 = [hola, holo].each { |user| FactoryBot.create(:user_chat, user_id: user.id, conversation: conversations.first) }
conversation_2 = [hola, helo].each { |user| FactoryBot.create(:user_chat, user_id: user.id, conversation: conversations.second) }
conversation_3 = [holo, helo].each { |user| FactoryBot.create(:user_chat, user_id: user.id, conversation: conversations.last) }

messages_1 = 15.times { FactoryBot.create(:message, conversation: conversations.first, user_id: [hola, holo].sample.id) }
messages_2 = 15.times { FactoryBot.create(:message, conversation: conversations.second, user_id: [hola, helo].sample.id) }
messages_3 = 15.times { FactoryBot.create(:message, conversation: conversations.last, user_id: [holo, helo].sample.id) }


# SEED ENTERPRISE
enterprise = FactoryBot.create(:enterprise, name: 'Cửa hàng Thành Công', address: '244 Cống Quỳnh, Quận 1', phone: '912819284', user_id: hola.id)
