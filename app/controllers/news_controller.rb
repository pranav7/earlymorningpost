class NewsController < ApplicationController
	# Find the methods in the Application Controller
	before_filter :authenticate, except: [:show, :like]

	def index
		@news = News.order(:created_at).page params[:page]
		@title = "Index"
	end
	
	def new
		@news = News.new
		@category = Category.all
		@title = "Add News"
	end

	def create
    category = Category.find params[:news][:category_id]

    if !params[:source_link].blank?
      News.read_and_create(params[:source_link], category)

      redirect_to category_path(Category.find(category))
      return
    elsif !params[:feed_url].blank?
      News.parse_and_create_news(params[:feed_url], category)

      redirect_to category_path(Category.find(category))
    else
      @news = News.new(params[:news])
      if @news.save
        redirect_to @news, :flash => { :notice => "News Posted!"}
      else
        render 'new'
      end
    end 
	end

	def show
		@news = News.find(params[:id])
		@title = @news.title
	end

	def edit
		@news = News.find(params[:id])
		@title = "Edit"	
	end

	def update
		@news = News.find(params[:id])
		if @news.update_attributes(params[:news])
			redirect_to @news, :flash => { :notice => "News Updated!" }
		else
			@title = "Edit"
			render 'edit'
		end
	end

	def destroy
		@news = News.find(params[:id])
		@news.destroy

    flash[:alert] = "News Deleted"
    redirect_to news_index_path
	end

  def like
    @news = News.find(params[:news_id])

    if @news.like!
      respond_to do |format|
        format.json { render json: @news.likes, status: :no_content }
      end
    else
      respond_to do |format|
        format.json { render json: "ERROR", status: :bad_request }
      end
    end
  end

	private

  def news_params
    params.require(:news).permit(:title, :content, :category)
  end
end
