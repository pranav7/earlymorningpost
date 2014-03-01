namespace :db do
	desc "Fill Database with categories"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke if :environment != :production
		Category.create!(:name => "Technology")
		Category.create!(:name => "Sports")
		Category.create!(:name => "World")
		Category.create!(:name => "Entertainment")
	end	
end