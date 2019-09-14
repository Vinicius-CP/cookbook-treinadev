class RecipesController < ApplicationController
  before_action :find_id, only: %i[show edit update]

  def index
    @recipes = Recipe.all
  end

  def show ; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
      flash[:notice] = 'Receita criada com sucesso!'
    else
      render :new
    end
  end

  def edit ; end

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to @recipe
      flash[:notice] = 'Receita atualizada com sucesso!'
    else
      render :edit
    end
  end

  def search
    @recipes = Recipe.where("title LIKE ?","#{params[:search]}")

    if @recipes.empty?
      flash[:notice] = 'Não foi possível encontrar a receita'
      redirect_to root_path
    end
  end

  private

  def recipe_params 
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method)
  end

  def find_id
    @recipe = Recipe.find(params[:id])
  end
end
