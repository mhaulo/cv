module ResumesHelper
	def month_and_year(date)
		date.strftime "%m/%Y" rescue ""
	end
	
	def rating_stars(rating)
		# Computer math does the trick for us. Because the max value for rating
		# is 100 and we want to express the skill with 5-star rating, we can simply
		# divide by 20. The result is an integer – decimals will be discarded.
		num_of_filled_stars = rating / 20
		
		num_of_empty_stars = 5 - num_of_filled_stars
		rating_string = ""
		
		num_of_filled_stars.times do
			rating_string << "★"
		end
		
		num_of_empty_stars.times do
			rating_string << "☆"
		end
		
		rating_string
	end
	
	def resume_status_text(resume)
		if resume.public
			"Public – anyone with the link can view this"
		else
			"Unpublished – only you can see this"
		end
	end
end
