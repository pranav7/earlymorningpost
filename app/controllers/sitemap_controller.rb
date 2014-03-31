class SitemapController < ApplicationController

	def sitemap
		@news = News.order(:created_at)
	end

	def rssfeed
		@news = News.order(:created_at)
	end

end