require 'rails_helper'

describe 'View recipe details' do
  it 'returns a json' do
    user = create(:user)
    recipe = create(:recipe, user: user)

    get "/api/v1/recipes/#{recipe.id}"
    json_recipe = JSON.parse(response.body, symbolize_names: true)

    expect(json_recipe[:title]).to eq recipe.title
    expect(json_recipe[:difficulty]).to eq recipe.difficulty
    expect(json_recipe[:cook_time]).to eq recipe.cook_time
    expect(json_recipe[:ingredients]).to eq recipe.ingredients
    expect(json_recipe[:cook_method]).to eq recipe.cook_method
    expect(response).to have_http_status(200)
  end

  it 'returns status 400 if the recipe doesnt exist' do
    get api_v1_recipe_path(111)
    json_recipe = JSON.parse(response.body, symbolize_names: true)

    expect(json_recipe[:message]).to eq 'Receita não encontrada'
    expect(response).to have_http_status(404)
  end
end