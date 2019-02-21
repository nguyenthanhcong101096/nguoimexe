# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  phone                  :string           not null
#  encrypted_password     :string           default(""), not null
#  address                :string
#  username               :string
#  avatar_data            :text
#  slug_name              :string
#  range                  :string
#  followers_count        :integer
#  following_count        :integer
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  type_account           :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
