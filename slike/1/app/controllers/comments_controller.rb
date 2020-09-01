class CommentsController < ApplicationController
	before_action :find_recipe
	before_action :find_comment, only: [:edit, :update, :destroy]

	def new
		@comment = Comment.new
	end

	def create
		@recipe = Recipe.find(params[:recipe_id])
		@comment = @recipe.comments.create(params[:comment].permit(:user, :comment))

		if @comment.save
			redirect_to recipe_path(@recipe)
		else
			render 'new'
		end
	end

	def edit
	end

	def destroy
		@comment.destroy
		redirect_to recipe_path(@recipe)
	end

	def update
		if @comment.update(comment_params)
			redirect_to recipe_path(@recipe)
		else
			render 'edit'
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:comment)
	end

	def find_recipe
		@recipe = Recipe.find(params[:recipe_id])
	end

	def find_comment
		@comment = Comment.find(params[:id])
	end
end
