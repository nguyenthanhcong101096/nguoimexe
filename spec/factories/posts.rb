# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                   :integer          not null, primary key
#  title                :string
#  describe             :string
#  user_id              :bigint(8)        not null
#  vehicle_kind_id      :bigint(8)        not null
#  status               :string           default("spending"), not null
#  featured_image_data  :text
#  car_life             :string           default("Unknown")
#  capacity             :string           default("Unknown")
#  range_of_vehicle     :string           default("Unknown")
#  status_of_vehicle    :string
#  price                :float            default(0.0), not null
#  year_of_registration :string           default("Unknown")
#  km                   :string           default("Unknown")
#  slug_title           :string
#  city_id              :bigint(8)
#  color                :string           default("Unknown")
#  views_count          :integer          default(0), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.paragraph }
    describe 'ddd'
    car_life '2010'
    capacity '200cc'
    range_of_vehicle 'Tay ga'
    status_of_vehicle 'Da su dung'
    year_of_registration '2011'
    km '10300'
    price 153000999
    color 'Mau do'
  end
end
