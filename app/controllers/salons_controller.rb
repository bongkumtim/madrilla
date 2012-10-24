
class SalonsController < ApplicationController

	def index
	    @salons = Salon.paginate(page: params[:page])
	end

	def new
		@salon = Salon.new
	end
	
	def create 
		@salon = Salon.new(params[:salon])
		if @salon.save
			# everything is good. handle the success scenario
			flash[:success] = "Thanks for signing up your salon with Madrilla!"
			redirect_to @salon
		else
			render 'new'
		end
	end

	def show 
		@salon = Salon.find(params[:id])
		# @stylist = @salon.stylists.build
		@employee = @salon.users.build

		respond_to do |format|
			format.html
			format.json { render json: @salon }
		end

	end

	def edit
		@salon = Salon.find(params[:id])
	end



  def update
  	@salon = Salon.find(params[:id])
  	if @salon.update_attributes(params[:salon])
  		flash[:success] = "Salon updated"
  		redirect_to @salon
  	else
  		render 'edit'
  	end
  end

  def destroy
  	Salon.find(params[:id]).destroy
  	flash[:success] = 'Salon deleted'
  	redirect_to salons_url
  end

end
