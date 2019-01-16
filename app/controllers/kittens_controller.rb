class KittensController < ApplicationController
	def index
		@kittens = Kitten.all
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.create(kitten_params)
		redirect_to root_path
	end

	def edit
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def update
	end

	def destroy
	end

	private

	def kitten_params
		params.require(:kitten).permit(:name, :age, :softness, :cuteness)
	end
end
