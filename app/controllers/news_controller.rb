class NewsController < ApplicationController
	# Find the methods in the Application Controller
	before_filter :authenticate, except: :show

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
    if params[:feed_url]
      parse_and_create_news

      redirect_to category_path(Category.find(params[:news][:category_id])) 
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

	private

  def news_params
    params.require(:news).permit(:title, :content, :category)
  end

  def parse_and_create_news
    doc = Nokogiri::XML open(params[:feed_url])

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
      news.category = Category.find(params[:news][:category_id])
      news.external = true

      if news.save
        Rails.logger.info "###### OK ########"
      else
        Rails.logger.warn "##### ERRORS ######"
        Rails.logger.warn news.errors.full_messages
      end
    end
  end
end
