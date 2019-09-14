require 'rails_helper'

feature 'User search recipe' do
    scenario 'successfully' do
        recipe_type = create(:recipe_type, name: 'Veggie')
        recipe = create(:recipe, recipe_type: recipe_type)
        other_recipe = create(:recipe, title: 'Salada Light')

        visit root_path

        fill_in 'Buscar', with: recipe.title
        click_on 'Pesquisar receita'

        expect(page).to have_css('h1', text: recipe.title)
        expect(page).not_to have_content(other_recipe.title)

    end

    scenario 'and dont find recipe' do
        recipe_type = create(:recipe_type, name: 'Veggie')
        recipe = create(:recipe, recipe_type: recipe_type)
        other_recipe = create(:recipe, title: 'Salada Light') 

        visit root_path

        fill_in 'Buscar', with: 'Salada Gourmet'
        click_on 'Pesquisar receita' 

        expect(page).to have_content('Não foi possível encontrar a receita')
    end
    scenario 'and find likely recipes' do
        recipe_type = create(:recipe_type, name: 'Veggie')
        recipe = create(:recipe, title: 'Salada Light', recipe_type: recipe_type)
        other_recipe = create(:recipe, title: 'Salada Gourmet', recipe_type: recipe_type)
        another_recipe = create(:recipe, title: 'Macarronada', recipe_type: recipe_type)

        visit root_path
        fill_in 'Buscar', with: 'Salada'
        click_on 'Pesquisar receita'

        expect(page).to have_css('h1', text: recipe.title)
        expect(page).to have_css('h1', text: other_recipe.title)
        expect(page).not_to have_content(another_recipe.title)
    end
end