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

class Haiku < ActiveRecord::Base

  has_many :likes
  belongs_to :user
  # scope :top4,

  validates_with SyllableValidator

  def self.top4
    top4_by_id = Haiku.joins(:likes).group(:haiku_id).
    order("count_all DESC").limit(4).count
    populate_hash(top4_by_id)
  end

  def self.populate_hash(top4)
    top4.collect do |haiku_id,num_of_likes|
      {haiku:find(haiku_id), likes:num_of_likes}
    end
  end

  def self.make_from_gem
    first_line = HaikuGadget.top_line
    second_line = HaikuGadget.middle_line
    third_line = HaikuGadget.bottom_line
    create(line1: first_line, line2: second_line, line3: third_line, user_id: 1)
  end

  def self.get_two_random_haikus
    all.sample(2)
  end

  def like
    self.likes += 1
    save
  end

end
