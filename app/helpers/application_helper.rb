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

	def logoHeader
		image_tag("logoHeader.png",	:alt => "The Early Morning Post" )
	end

	def logoFooter
		image_tag("logoFooter.png",	:alt => "The Early Morning Post",	
									:size => "175" )
	end

end
