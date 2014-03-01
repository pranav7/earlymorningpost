class PagesController < ApplicationController
  def home
    @title = "Home"
    @news = News.all
  end

  def technology
    @title = "Technology"
    @category = select_category
    @news = @category.news
  end

  def sports
    @title = "Sports"
    @category = select_category
    @news = @category.news
  end

  def world
    @title = "World"
    @category = select_category
    @news = @category.news
  end

  def entertainment
    @title = "Entertainment"
    @category = select_category
    @news = @category.news
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
