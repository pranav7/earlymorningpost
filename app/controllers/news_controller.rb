class NewsController < ApplicationController

	def index
		@news = News.order(:created_at).page(params[:page])
		@title = "Index"
	end

	def new
		@news = News.new
		@category = Category.all
		@title = "Add News"
	end

	def create
		@news = News.new(params[:news])
		if @news.save
			#redirection to implemented
			redirect_to @news, :flash => { :notice => "News Posted!"}
		else
			render 'new'
		end
	end

	def show
		@news = News.find(params[:id])
	end

	def edit
		@news = News.find(params[:id])
		@title = "Edit"	
	end

	def update
		@news = News.find(params[:id])
		if @news.update_attributes(params[:news])
			#redirection to implemented
			redirect_to @news, :flash => { :notice => "News Updated!" }
		else
			@title = "Edit"
			render 'edit'
		end
	end

	def destroy		
	end

	private

		def news_params
			params.require(:news).permit(:title, :content, :category)
		end

end
