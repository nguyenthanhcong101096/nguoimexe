# frozen_string_literal: true

class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :phone, uniqueness: true
  validates :phone, format: { with: /\d{3}\d{3}\d{4}/, message: 'bad format' }

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
