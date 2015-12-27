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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
