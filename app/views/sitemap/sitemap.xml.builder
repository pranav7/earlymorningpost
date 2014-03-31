xml.instruct! :xml, :version => "1.0"
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  for news in @news do
    xml.url do
      xml.loc news_url(news)
      xml.lastmod news.updated_at.to_date
      xml.changefreq "monthly"
      xml.priority "0.5"
    end
  end
end