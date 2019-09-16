class Api::V1::RecipesController < Api::V1::ApiController
    def show
        @recipe = Recipe.find(params[:id])
        render json: @recipe, status: 200 #ok

    rescue ActiveRecord::RecordNotFound
        render json: { message: 'Receita não encontrada'}, status: 404 #not_found
    end
end