module ApplicationHelper

	#Returns a title as per the page
	def title
		base_title = "The Early Morning Post"
		if @title.nil?
			base_title
		else
			"#{@title} | #{base_title}"
		end
	end

	def logo
		image_tag("logo.png",	:alt => "The Early Morning Post",	:size => "200" )
	end

end
