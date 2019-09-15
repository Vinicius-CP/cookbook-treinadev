class RecipesController < ApplicationController
  before_action :find_id, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[new create edit update myrecipes]

  def index
    @recipes = Recipe.all
  end

  def show ; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
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
    @recipes = Recipe.where("title LIKE ?","%#{params[:search]}%")

    if @recipes.empty?
      flash[:notice] = 'Não foi possível encontrar a receita'
      redirect_to root_path
    end
  end

  def myrecipes
    if current_user.recipes.empty?
      flash[:notice] = 'Você ainda não possui nenhuma receita'
      redirect_to root_path
    end
    @recipes = Recipe.where(user: current_user)
  end

  private

  def recipe_params 
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method)
  end

  def find_id
    @recipe = Recipe.find(params[:id])
  end
end
