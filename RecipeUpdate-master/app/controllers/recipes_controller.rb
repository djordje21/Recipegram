# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[show edit update destroy vote]
  before_action :authenticate_user!, only: %i[new edit vote]

  def index
    if params[:category].blank?
      @recipes = Recipe.paginate(page: params[:page])
    else
      @category_id = Category.find_by(name: params[:category]).id
      @recipes = Recipe.where(category_id: @category_id).order('created_at DESC')
    end
  end

  def show; end

  def new
    @recipe = current_user.recipes.build
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    @recipe.category_id = params[:category_id]

    if @recipe.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @recipe.category_id = params[:category_id]
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def vote
    value = params[:type] == 'Like' ? 1 : -1
    @recipe.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: 'Thanks!'
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :author, :category_id, :recipe_img)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
