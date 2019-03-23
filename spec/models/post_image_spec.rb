# frozen_string_literal: true

# == Schema Information
#
# Table name: post_images
#
#  id                  :integer          not null, primary key
#  post_imageable_id   :integer
#  post_imageable_type :string
#  url                 :string           default("Unknow")
#  public_id           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe PostImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
