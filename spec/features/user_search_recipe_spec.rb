require 'rails_helper'

feature 'User search recipe' do
    scenario 'successfully' do
        user = create(:user)
        recipe_type = create(:recipe_type, name: 'Veggie')
        recipe = create(:recipe, recipe_type: recipe_type, user: user)
        other_recipe = create(:recipe, title: 'Salada Light', user: user)

        login_as(user, :scope => :user)
        visit root_path

        fill_in 'Buscar', with: recipe.title
        click_on 'Pesquisar receita'

        expect(page).to have_css('h1', text: recipe.title)
        expect(page).not_to have_content(other_recipe.title)

    end

    scenario 'and dont find recipe' do
        user = create(:user)
        recipe_type = create(:recipe_type, name: 'Veggie')
        recipe = create(:recipe, recipe_type: recipe_type, user: user)
        other_recipe = create(:recipe, title: 'Salada Light', user:user) 

        visit root_path

        fill_in 'Buscar', with: 'Salada Gourmet'
        click_on 'Pesquisar receita' 

        expect(page).to have_content('Não foi possível encontrar a receita')
    end
    scenario 'and find likely recipes' do
        user = create(:user)
        recipe_type = create(:recipe_type, name: 'Veggie')
        recipe = create(:recipe, title: 'Salada Light', recipe_type: recipe_type, user: user)
        other_recipe = create(:recipe, title: 'Salada Gourmet', recipe_type: recipe_type, user: user)
        another_recipe = create(:recipe, title: 'Macarronada', recipe_type: recipe_type, user: user)

        visit root_path
        fill_in 'Buscar', with: 'Salada'
        click_on 'Pesquisar receita'

        expect(page).to have_css('h1', text: recipe.title)
        expect(page).to have_css('h1', text: other_recipe.title)
        expect(page).not_to have_content(another_recipe.title)
    end
end