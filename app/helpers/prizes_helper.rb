# == Schema Information
#
# Table name: prizes
#
#  id                  :integer          not null, primary key
#  name                :string           not null
#  number_of_referrals :integer          default(1), not null
#  image_file_name     :string
#  image_content_type  :string
#  image_file_size     :integer
#  image_updated_at    :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

module PrizesHelper
end
