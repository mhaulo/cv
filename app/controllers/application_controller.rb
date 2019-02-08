class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
	protected

	def set_resume
		@resume = current_user.resumes.find(params[:resume_id])
		raise ActionController.RoutingError.new("Not Found") if @resume.nil?
	end
end
