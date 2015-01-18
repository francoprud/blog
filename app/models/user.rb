class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:google_oauth2, :facebook]

  def self.find_for_google_oauth2(access_token, _signed_in_resource = nil)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(email: data['email'],
                         password: Devise.friendly_token[0, 20])
    end
    user
  end

  def self.find_for_facebook_oauth(access_token, _signed_in_resource = nil)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(email: data['email'],
                         first_name: data['first_name'],
                         last_name: data['last_name'],
                         password: Devise.friendly_token[0, 20])
    end
    user
  end
end
