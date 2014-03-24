namespace :db do
	desc "Fill Database with categories"
	task :populate => :environment do
		# Rake::Task['db:reset'].invoke if :environment != :production
		Category.create!(:name => "Technology")
		Category.create!(:name => "Science")
		Category.create!(:name => "World")
		Category.create!(:name => "Entertainment")
	end

	desc "Fill Category with Science"
	task :populate_science => :environment do
		# Rake::Task['db:reset'].invoke if :environment != :production
		Category.create!(:name => "Science")
	end

	desc "Drop Sports"
	task :drop_sports => :environment do
		# Rake::Task['db:reset'].invoke if :environment != :production
		Category.find(2).destroy
	end
end