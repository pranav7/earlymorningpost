# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.earlymorningpost.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'daily',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #

  add_to_index '/sitemap.xml.gz'
  # Add all news:
    News.find_each do |news|
      add url_for(:controller => 'news', 
                  :action => 'show',
                  :id => news, 
                  :only_path => 'true', 
                  ),  :pagemap => {
                        :dataobjects => [{
                          :type => 'document',
                          :attributes => [
                              { :name => 'title',       :value => news.title },
                              { :name => 'content',       :value => news.content[0..140] },
                              { :name => 'last_update', :value => news.updated_at },
                            ]
                          }]
                      }

    end
end

SitemapGenerator::Sitemap.ping_search_engines