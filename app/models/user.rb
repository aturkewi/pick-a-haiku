# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  name             :string
#  provider         :string
#  uid              :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  oauth_token      :string
#  oauth_expires_at :datetime
#

class User < ActiveRecord::Base

  has_many :haikus
  has_many :likes
  has_many :favorites

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.save
    end
  end
end
