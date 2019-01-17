class KittensController < ApplicationController
	def index
		@kittens = Kitten.all

		respond_to do |format|
			format.html
			format.json { render :json => @kittens }
		end
	end

	def new
		@action = "create"

		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.create(kitten_params)
		redirect_to root_path
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def show
		@kitten = Kitten.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render :json => @kitten }
		end
	end

	def update
		@action = "update"
		@kitten = Kitten.find(params[:id])
		@kitten.update_attributes(kitten_params)
		redirect_to root_path
	end

	def destroy
		@kitten = Kitten.find(params[:id])
		@kitten.destroy
		redirect_to root_path, notice: 'Kitten deleted'
	end

	private

	def kitten_params
		params.require(:kitten).permit(:name, :age, :softness, :cuteness)
	end
end
