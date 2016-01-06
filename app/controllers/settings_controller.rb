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

class SettingsController < ApplicationController
	before_filter :authenticate_admin

	def index
		@setting = Setting.first || Setting.new

		render layout: "dashboard"
	end

	def create
		setting = Setting.new(setting_params)

		if setting.save
			redirect_to settings_path, notice: "Settings have been updated" 
		else
			redirect_to settings_path, notice: "Settings haven't been updated" 
		end
	end

	def update
		setting = Setting.find(params[:id])

		if setting.update(setting_params)
			redirect_to settings_path, notice: "Settings have been updated" 
		else
			render :index, layout: "dashboard"
		end
	end

	private

	def setting_params
 		params.require(:setting).permit(:facebook_title, :facebook_image, :facebook_message, :twitter_message, :email_message, :email_subject, :cover_image, :additional_image, :linkedin_message, :linkedin_title, :pinterest_image, :pinterest_description, :google_plus_image, :twitter_image)
  	end 

end
