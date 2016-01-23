class HaikuSerializer < ActiveModel::Serializer
  attributes :id, :line1, :line2, :line3, :user_id, :favorited

  def favorited
    Favorite.where(user_id:serialization_options[:current_user].id, haiku_id:id).count != 0
  end

end
