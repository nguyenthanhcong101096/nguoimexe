hola  = FactoryBot.create(:user, phone: '345', address: 'aaaa', password: 'password', password_confirmation: 'password')
users = FactoryBot.create_list(:user, 10)
