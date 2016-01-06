# == Schema Information
#
# Table name: settings
#
#  id                             :integer          not null, primary key
#  facebook_message               :string
#  twitter_message                :string
#  email_message                  :text
#  email_subject                  :string
#  facebook_title                 :string
#  facebook_image_file_name       :string
#  facebook_image_content_type    :string
#  facebook_image_file_size       :integer
#  facebook_image_updated_at      :datetime
#  cover_image_file_name          :string
#  cover_image_content_type       :string
#  cover_image_file_size          :integer
#  cover_image_updated_at         :datetime
#  additional_image_file_name     :string
#  additional_image_content_type  :string
#  additional_image_file_size     :integer
#  additional_image_updated_at    :datetime
#  status                         :string           default("active")
#  pinterest_image_file_name      :string
#  pinterest_image_content_type   :string
#  pinterest_image_file_size      :integer
#  pinterest_image_updated_at     :datetime
#  twitter_image_file_name        :string
#  twitter_image_content_type     :string
#  twitter_image_file_size        :integer
#  twitter_image_updated_at       :datetime
#  pinterest_description          :string
#  linkedin_title                 :string
#  linkedin_message               :string
#  google_plus_image_file_name    :string
#  google_plus_image_content_type :string
#  google_plus_image_file_size    :integer
#  google_plus_image_updated_at   :datetime
#

class Setting < ActiveRecord::Base
	has_attached_file :cover_image, default_url: ->(attachment) { ActionController::Base.helpers.asset_path('placeholder.png') }
	validates_attachment :cover_image, :content_type => {:content_type => /\Aimage\/.*\Z/}

	has_attached_file :additional_image, default_url: ->(attachment) { ActionController::Base.helpers.asset_path('placeholder.png') }
	validates_attachment :additional_image, :content_type => {:content_type => /\Aimage\/.*\Z/}


	has_attached_file :facebook_image
	validates_attachment :facebook_image, :content_type => {:content_type => /\Aimage\/.*\Z/}

	has_attached_file :twitter_image
	validates_attachment :twitter_image, :content_type => {:content_type => /\Aimage\/.*\Z/}

	has_attached_file :pinterest_image
	validates_attachment :pinterest_image, :content_type => {:content_type => /\Aimage\/.*\Z/}	

	has_attached_file :google_plus_image
	validates_attachment :google_plus_image, :content_type => {:content_type => /\Aimage\/.*\Z/}

	after_save :clear_cache


	MAILCHIMP_API_KEY = nil
	MAILCHIMP_LIST_ID = nil

	def self.cover_image
		(Setting.first || Setting.new).cover_image
	end

	def self.additional_image
		(Setting.first || Setting.new).additional_image
	end

	def self.google_plus_image
		(Setting.first || Setting.new).google_plus_image
	end

	def self.facebook_image
		(Setting.first || Setting.new).facebook_image
	end

	def self.twitter_image
		(Setting.first || Setting.new).twitter_image
	end

	def self.pinterest_image
		(Setting.first || Setting.new).pinterest_image
	end

	def self.sharing
		setting = Setting.first || Setting.new
		return {
			twitter_message: setting.twitter_message || "",
			facebook_message: setting.facebook_message || "",
			email_message: setting.email_message || "", 
			email_subject: setting.email_subject || "",
			facebook_title: setting.facebook_title || "",
			pinterest_description: setting.pinterest_description || "",
			linkedin_title: setting.linkedin_title || "",
			linkedin_message: setting.linkedin_message || "",
		}
	end

	private

	def clear_cache
		Rails.cache.clear
	end
end
