class News < ActiveRecord::Base
	attr_accessible :title, 
					:content, 
					:category_id, 
					:sub_heading,
					:author,
					:image_courtesy, 
					:image,
					:remote_image_url,
					:video_url

	paginates_per 20

	belongs_to :category, dependent: :destroy

	# Validations, a news should have a Content, Title and Category ID.
	validates :content, presence: true
	validates :title, presence: true
	validates :category_id, presence: true

	# to associate carrierwave images to the model
	mount_uploader :image, ImageUploader

	# This sets the order of the news from New to Old, 
	# based on when it was updated.
	default_scope -> { order('updated_at DESC') }

	def to_param
		"#{id}+#{title.parameterize}"
	end
end

# == Schema Information
#
# Table name: news
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text
#  created_at     :datetime
#  updated_at     :datetime
#  category_id    :integer
#  sub_heading    :text
#  image          :string(255)
#  author         :string(255)
#  image_courtesy :string(255)
#  video_url      :string(255)
