require 'rails_helper'

feature 'User updates his recipes ' do
    scenario 'successfully' do
        visit root_path
        expect(page).not_to have_link('Cadastrar receita')
    end

    scenario 'and cant acess create recipe by route' do
        visit new_recipe_path
        expect(current_path).to eq new_user_session_path
      end

    scenario 'and unauthenticated user cannot edit recipe' do
    recipe = create(:recipe)

    visit root_path
    click_on recipe.title
    expect(page).not_to have_link('Editar')
    end

    scenario 'and cant acess edit recipe by route' do
        user = create(:user)
        recipe = create(:recipe, user: user) 
                                
        visit edit_recipe_path(recipe)

        expect(current_path).to eq new_user_session_path
    end
end