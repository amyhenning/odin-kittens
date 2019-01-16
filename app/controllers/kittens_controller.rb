class KittensController < ApplicationController
	def index
		@kittens = Kitten.all
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@action = "create"
		@kitten = Kitten.create(kitten_params)
		redirect_to root_path
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def update
		@action = "update"
		@kitten = Kitten.find(params[:id])
		@kitten.update_attributes(kitten_params)
		redirect_to root_path
	end

	def destroy
	end

	private

	def kitten_params
		params.require(:kitten).permit(:name, :age, :softness, :cuteness)
	end
end
