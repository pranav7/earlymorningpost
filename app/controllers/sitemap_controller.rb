class SitemapController < ApplicationController

	def sitemap
		@news = News.order(:created_at)
	end

	def rssfeed
		@news = News.order(:created_at)
	end

	def BingSiteAuth
		#nothing here as such!
	end

end