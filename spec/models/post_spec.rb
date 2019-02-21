# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                  :integer          not null, primary key
#  title               :string
#  describe            :string
#  user_id             :bigint(8)        not null
#  vehicle_kind_id     :bigint(8)        not null
#  status              :string           default("spending"), not null
#  featured_image_data :text
#  product_date        :string           default("Unknown")
#  brand               :string           default("Unknown"), not null
#  registration        :float            default(0.0), not null
#  price               :float            default(0.0), not null
#  slug_title          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
