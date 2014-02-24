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
#

class News < ActiveRecord::Base
	attr_accessible :title, :content

	belongs_to :category

	# Validations, a news should have a Content, Title and Category ID.
	validates :content, presence: true
	validates :title, presence: true
	validates :category_id, presence: true

	# This sets the order of the news from New to Old, 
	# based on when it was created.
	default_scope :order => 'news.created_at DESC'
end
