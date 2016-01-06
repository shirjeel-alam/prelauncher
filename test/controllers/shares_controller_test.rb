# == Schema Information
#
# Table name: shares
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  social_network :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class SharesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
