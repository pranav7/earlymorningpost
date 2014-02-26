class NewsController < ApplicationController

	def index
		# Needs to be implemented yet.
		render 'new'
	end

	def new
		@news = News.new
		@category = Category.all
		@title = "Add News"
	end

	def create
		@news = News.new(params[:news])
		if @news.save
			redirect_to root_path, :flash => { :success => "News Posted!"}
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
