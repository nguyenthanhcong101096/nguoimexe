VEHICLE_KIND = %i[oto moto bike other]
VEHICLE_KIND.each { |kind| FactoryBot.create(:vehicle_kind, name: kind) }

hola  = FactoryBot.create(:user, phone: '0338529345', address: 'aaaa', password: 'password', password_confirmation: 'password')
holo  = FactoryBot.create(:user, phone: '0338529346', address: 'aaaa', password: 'password', password_confirmation: 'password')
helo  = FactoryBot.create(:user, phone: '0338529347', address: 'aaaa', password: 'password', password_confirmation: 'password')
users = FactoryBot.create_list(:user, 5)

admin = AdminUser.create!(phone: '0338529345', password: 'password', password_confirmation: 'password') if Rails.env.development?

30.times  { FactoryBot.create(:post, user: User.all.sample, vehicle_kind: VehicleKind.all.sample ) }
200.times { comment = FactoryBot.create(:comment, user: User.all.sample, post: Post.all.sample) }
