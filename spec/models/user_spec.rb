# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string
#  phone                  :string
#  encrypted_password     :string           default(""), not null
#  address                :string
#  username               :string
#  avatar_data            :text
#  slug_name              :string
#  range                  :string
#  status                 :string           default("offline")
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
  describe 'associations' do
    it { should have_many(:groups).dependent(:destroy) }
    it { should have_many(:user_groups).dependent(:destroy) }
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:blogs).dependent(:destroy) }
    it { should have_many(:activities).dependent(:destroy) }
    it { should have_many(:messages).dependent(:destroy) }
    it { should have_many(:user_chats).dependent(:destroy) }
    it { should have_many(:conversations) }
    it { should have_many(:active_relationships).dependent(:destroy) }
    it { should have_many(:passive_relationships).dependent(:destroy) }
  end
end
