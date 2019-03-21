# frozen_string_literal: true

# == Schema Information
#
# Table name: post_images
#
#  id                  :integer          not null, primary key
#  post_image_data     :text
#  post_imageable_id   :integer
#  post_imageable_type :string
#  url                 :string           default("Unknow")
#  public_id           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryBot.define do
  factory :post_image do
    url 'https://picsum.photos/2000/1000/?random'
  end
end
