class PagesController < ApplicationController
	before_action :authenticate_user!
	
	def home
		@resumes = current_user.resumes
		@portfolios = current_user.portfolios
	end
end
