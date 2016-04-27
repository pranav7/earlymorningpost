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

	paginates_per 30

	belongs_to :category

	# Validations, a news should have a Content, Title and Category ID.
	validates :content, presence: true
	validates :title, presence: true
	validates :category_id, presence: true

	# to associate carrierwave images to the model
	mount_uploader :image, ImageUploader

	# This sets the order of the news from New to Old, 
	# based on when it was updated.
	default_scope -> { order('updated_at DESC') }

  def self.parse_and_create_news(feed_url, category)
    doc = Nokogiri::XML open(feed_url)

    doc.css("item").each do |item|
      google_link = item.xpath("link").text
      google_link =~ /url=(.*)/
      link = $1

      source = open(link).read rescue nil
      next unless source

      item.xpath("guid").text =~ /cluster=(\d{1,45})/
      guid = $1
      existing_news = News.find_by_source_id(guid)

      if existing_news
        Rails.logger.info "##### News with #{guid} already published #####"
        existing_news.save
        next
      end

      parsed = Readability::Document.new(source)
      news = News.new
      news.title = parsed.title
      news.content = parsed.content
      news.remote_image_url = parsed.images.first unless parsed.images.empty?
      news.link = link
      news.source_id = guid
      news.category = category
      news.external = true

      if news.save
        Rails.logger.info "###### OK ########"
      else
        Rails.logger.warn "##### ERRORS ######"
        Rails.logger.warn news.errors.full_messages
      end
    end
  end

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
