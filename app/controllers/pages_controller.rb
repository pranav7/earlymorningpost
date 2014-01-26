class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def technology
    @title = "Technology"
  end

  def sports
    @title = "Sports"
  end

  def world
    @title = "World"
  end

  def entertainment
    @title = "Entertainment"
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact Us"
  end
end
