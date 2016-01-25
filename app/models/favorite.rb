# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  haiku_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :haiku

  validates :user_id, uniqueness: { scope: [:haiku_id] }

end
