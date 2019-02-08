class PortfoliosController < ApplicationController
	before_action :authenticate_user!
	before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

	def index
		# Because we don't have a separate portfolio listing page and show the lists
		# of both resumes and portfolios on the same page, let's add this redirect
		# just in case the user lands here.
		redirect_to root_path
	end

	def show
	end

	def new
		@portfolio = Portfolio.new
	end

	def edit
	end

	def create
		@portfolio = current_user.portfolios.new(portfolio_params)

		respond_to do |format|
			if @portfolio.save
				format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
				format.json { render :show, status: :created, location: @portfolio }
			else
				format.html { render :new }
				format.json { render json: @portfolio.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @portfolio.update(portfolio_params)
				format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
				format.json { render :show, status: :ok, location: @portfolio }
			else
				format.html { render :edit }
				format.json { render json: @portfolio.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@portfolio.destroy
		respond_to do |format|
			format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	
	def set_portfolio
		@portfolio = current_user.portfolios.find(params[:id])
	end

	def portfolio_params
		params.require(:portfolio).permit(
			:name, :description, :picture, :user_id,
			samples_attributes: [:id, :title, :body, :picture, :_destroy]
		)
	end
end
