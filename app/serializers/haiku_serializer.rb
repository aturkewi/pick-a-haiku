class HaikuSerializer < ActiveModel::Serializer
  attributes :id, :line1, :line2, :line3, :user_id, :favorited

  def favorited

  end

end
