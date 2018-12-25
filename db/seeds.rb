VEHICLE_KIND = %i[oto moto bike other]
VEHICLE_KIND.each { |kind| FactoryBot.create(:vehicle_kind, name: kind) }

hola  = FactoryBot.create(:user, phone: '0338529345', address: 'aaaa', password: 'password', password_confirmation: 'password')
holo  = FactoryBot.create(:user, phone: '0338529346', address: 'aaaa', password: 'password', password_confirmation: 'password')
users = FactoryBot.create_list(:user, 10)

admin = AdminUser.create!(phone: '0338529345', password: 'password', password_confirmation: 'password') if Rails.env.development?

20.times  { FactoryBot.create(:post, user: users.sample, vehicle_kind: VehicleKind.all.sample ) }
200.times { comment = FactoryBot.create(:comment, user: users.sample, post: Post.all.sample) }
