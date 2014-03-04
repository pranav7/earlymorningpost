# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#  sub_heading :text
#  image       :string(255)
#

class News < ActiveRecord::Base
	attr_accessible :title, 
					:content, 
					:category_id, 
					:sub_heading, 
					:image,
					:remote_image_url

	belongs_to :category

	# Validations, a news should have a Content, Title and Category ID.
	validates :content, presence: true
	validates :title, presence: true
	validates :category_id, presence: true

	# to associate carrierwave images to the model
	mount_uploader :image, ImageUploader

	# This sets the order of the news from New to Old, 
	# based on when it was created.
	default_scope -> { order('created_at DESC') }
end
