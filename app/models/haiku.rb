# == Schema Information
#
# Table name: haikus
#
#  id         :integer          not null, primary key
#  line1      :string
#  line2      :string
#  line3      :string
#  likes      :integer
#  compGen    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Haiku < ActiveRecord::Base

  validates_with SyllableValidator

  def self.make_from_gem
    first_line = HaikuGadget.top_line
    second_line = HaikuGadget.middle_line
    third_line = HaikuGadget.bottom_line
    create(line1: first_line, line2: second_line, line3: third_line, compGen: true)
  end

  def self.get_two_random_haikus
    all.sample(2)
  end

  def like
    self.likes += 1
    save
  end

end
