VEHICLE_KIND = %i[oto moto bike other]
VEHICLE_KIND.each { |kind| FactoryBot.create(:vehicle_kind, name: kind) }

# SEED USER
hola  = FactoryBot.create(:user, phone: '0338529345', address: 'aaaa', password: 'password', password_confirmation: 'password')
holo  = FactoryBot.create(:user, phone: '0338529346', address: 'aaaa', password: 'password', password_confirmation: 'password')
helo  = FactoryBot.create(:user, phone: '0338529347', address: 'aaaa', password: 'password', password_confirmation: 'password')
users = FactoryBot.create_list(:user, 5)

admin = AdminUser.create!(phone: '0338529345', password: 'password', password_confirmation: 'password') if Rails.env.development?

follows = User.all.each { |user| FactoryBot.create(:follow, user: hola, target_user: user) }

30.times  { FactoryBot.create(:post, user: User.all.sample, vehicle_kind: VehicleKind.all.sample ) }
200.times { comment = FactoryBot.create(:comment, user: User.all.sample, post: Post.all.sample) }

# SEED CONVERSATIONS
conversations = FactoryBot.create_list(:conversation, 2)
[hola, holo].each { |user| FactoryBot.create(:user_chat, user: user, conversation: conversations.first) }
messages = 30.times { FactoryBot.create(:message, conversation: conversations.first, user: [hola, holo].sample) }
