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

class Prize < ActiveRecord::Base
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :name, presence: true
	validates :number_of_referrals, numericality: { :greater_than => 0}, presence: true

	def winners
		user_ids = []
		User.all.each do |user|
			if user.prize == self
				user_ids << user.id
			end
		end
		return User.where(id: user_ids)
	end

	def number_of_winners
		winners.count
	end
end
