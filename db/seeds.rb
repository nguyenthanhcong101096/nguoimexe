hola  = FactoryBot.create(:user, phone: '0338529346', address: 'aaaa', password: 'password', password_confirmation: 'password')
AdminUser.create!(phone: '0338529345', password: 'password', password_confirmation: 'password') if Rails.env.development?
