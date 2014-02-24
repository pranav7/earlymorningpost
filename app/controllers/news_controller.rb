class NewsController < ApplicationController

	def index
	end

	def new
		@news = News.new
		@category = Category.all
		@title = "Add News"
	end

	def create
		@news = News.new(news_params)
		if @news.save
			# We'll implement success here.
		else
			render 'new'
		end
	end

	def show
	end

	def edit		
	end

	def update
	end

	def destroy		
	end

	private

		def news_params
			params.require(:news).permit(:title, :content, :category)
		end

end
