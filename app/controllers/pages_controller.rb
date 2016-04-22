class PagesController < ApplicationController
  def home
    redirect_to category_path(Category.first)

    @news = News.where(active: true).page params[:page]
    @home_page = true
  end

  def technology
    @title = "Technology"
    @category = select_category
    @news = @category.news
    @home_page = true
  end

  def science
    @title = "Science"
    @category = select_category
    @news = @category.news
    @home_page = true
  end

  def world
    @title = "World"
    @category = select_category
    @news = @category.news
    @home_page = true
  end

  def entertainment
    @title = "Entertainment"
    @category = select_category
    @news = @category.news
    @home_page = true
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact Us"
  end

  private

  def select_category
    Category.find_by_name(@title)
  end
end
