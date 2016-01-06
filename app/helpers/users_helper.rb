# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string           not null
#  referral_code :string
#  referrer_id   :integer
#  ip_address    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

module UsersHelper
end
