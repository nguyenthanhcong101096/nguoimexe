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
#  status               :string           default(NULL), not null
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
    title { Faker::Lorem.sentence(rand(2..10)).chomp('.') }
    describe { Faker::Lorem.paragraphs(rand(3..10)).join('') }
    car_life { '2010' }
    capacity { '200cc' }
    range_of_vehicle { 'Tay Ga' }
    status_of_vehicle { 'Đã sử dụng' }
    year_of_registration { '2011' }
    km { '1500KM' }
    price { Faker::Number.number(9) }
    color { 'Mau do' }
  end
end
