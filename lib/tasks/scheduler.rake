namespace :scheduler do
  task update_feed: :environment do
    Rails.logger = Logger.new(STDOUT)

    world = "https://news.google.com/news?cf=all&hl=en&pz=1&ned=us&topic=w&output=rss"
    tech = "https://news.google.com/news?cf=all&hl=en&ned=us&topic=t&output=rss"
    sports_in = "https://news.google.com/news?cf=all&hl=en&pz=1&ned=in&topic=s&output=rss"
    sports_uk = "https://news.google.com/news?cf=all&hl=en&ned=uk&topic=s&output=rss"

    News.parse_and_create_news(world, Category.find_by_name("World"))
    News.parse_and_create_news(tech, Category.find_by_name("Tech/Science"))
    News.parse_and_create_news(sports_in, Category.find_by_name("Sports"))
    News.parse_and_create_news(sports_uk, Category.find_by_name("Sports"))
  end
end
