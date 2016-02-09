class PartnershipsController < ApplicationController

	def new
		
	end

	def create
		@partnership = Partnership.new(
			name: params[:name]
		)
		if @partnership.save
			redirect_to "/partnerships/#{@partnership.id}"
		end
	end

	def show
		@partnership = Partnership.find(params[:id])
	end

end
