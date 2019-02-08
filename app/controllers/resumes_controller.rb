class ResumesController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	before_action :set_resume, only: [:edit, :update, :destroy]

	def index
		# Because we don't have a separate resume listing page and show the lists
		# of both resumes and portfolios on the same page, let's add this redirect
		# just in case the user lands here.
		redirect_to root_path
	end

	def show
		# A resume can be viewed if it's 1) public, or 2) owned by the current user.
		# Therefore these steps must be separate and we cannot use
		# current_user.resumes.find(params[:id]) as we would otherwise do.
		@resume = Resume.find(params[:id])
		unless @resume.public or (user_signed_in? and @resume.user == current_user)
			raise ActionController::RoutingError.new('Forbidden')
		end
		
		if @resume
			# Academic degrees are usually listed latest first. The completion of
			# the degree matters more than the start of the education.
			@academic_degrees = @resume.academic_degrees.order("ended_at desc")
			
			# In contrast to education, work experience is usually listed by starting
			# date, also because people can have multiple concurrent jobs (for example
			# a full time day job and a part-time business). But also in this case the
			# latest one is listed first.
			@experiences = @resume.experiences.order("started_at desc")
			
			# Skills and portfolios don't have any particular order. At least for now.
			@skills = @resume.skills
			@portfolios = @resume.portfolios
		end
	end

	def new
		@resume = Resume.new
	end

	def edit
	end

	def create
		@resume = current_user.resumes.new(resume_params)

		respond_to do |format|
			if @resume.save
				format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
				format.json { render :show, status: :created, location: @resume }
			else
				format.html { render :new }
				format.json { render json: @resume.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @resume.update(resume_params)
				format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
				format.json { render :show, status: :ok, location: @resume }
			else
				format.html { render :edit }
				format.json { render json: @resume.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@resume.destroy
		respond_to do |format|
			format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def set_resume
		@resume = current_user.resumes.find(params[:id])
	end

	def resume_params
		params.require(:resume).permit(
			:name, :email, :phone, :picture, :public,
			experiences_attributes: [:id, :name, :title, :body, :started_at, :ended_at, :_destroy],
			academic_degrees_attributes: [:id, :title, :school, :description, :started_at, :ended_at, :_destroy],
			skills_attributes: [:id, :name, :description, :rating, :_destroy],
			portfolio_ids: []
		)
	end
end
