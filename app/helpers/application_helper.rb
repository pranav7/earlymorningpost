module ApplicationHelper
	# Returns a title as per the page
	def title
		base_title = "Early Morning Post"
		if @title.nil?
			base_title
		else
			"#{@title} | #{base_title}"
		end
	end

	def logoHeader
		image_tag("logo-header.png",	alt: "Early Morning Post" )
	end
  
  def shortLogoHeader
    image_tag("short-logo.png",	alt: "Early Morning Post" )
  end

	def logoFooter
		image_tag "logo-footer.png", alt: "Early Morning Post", width: 380
	end
end
