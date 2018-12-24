class User < ApplicationRecord
  has_many :posts
  has_many :comments
  
  devise :database_authenticatable, :registerable,         
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
         
  validates :phone, uniqueness: true
  validates :phone, format: { with: /\d{3}\d{3}\d{4}/, message: "bad format" }
  
  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.type_account = 'email'
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end
end
