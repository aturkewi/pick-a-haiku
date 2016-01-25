# == Schema Information
#
# Table name: haikus
#
#  id         :integer          not null, primary key
#  line1      :string
#  line2      :string
#  line3      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class HaikuSerializer < ActiveModel::Serializer
  attributes :id, :line1, :line2, :line3, :user_id, :favorited

  def favorited
    Favorite.where(user_id:user, haiku_id:id).count != 0
  end

  def user
    current_user = serialization_options[:current_user]
    current_user ? current_user.id : 2
  end

end
