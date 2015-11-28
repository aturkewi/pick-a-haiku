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

require 'test_helper'

class HaikuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
