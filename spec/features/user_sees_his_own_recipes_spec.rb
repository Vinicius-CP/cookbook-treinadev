require 'rails_helper'

feature 'User sees his own recipes' do
    scenario 'successfully' do
        user = create(:user)
        other_user = create(:user, email: 'natan@email.com')
        login_as(user, :scope => :user)

        recipe_type = create(:recipe_type, name: 'Veggie')
        recipe = create(:recipe, user: other_user)
        other_recipe = create(:recipe, title: 'Salada Gourmet', recipe_type: recipe_type, user: user)
        another_recipe = create(:recipe, title: 'Salada Light', recipe_type: recipe_type, user: user)
        
        visit root_path

        click_on 'Minhas receitas'

        expect(page).to have_css('h1', text: other_recipe.title)
        expect(page).to have_css('h1', text: another_recipe.title)
        expect(page).not_to have_content(recipe.title)
        expect(page).to have_link('Voltar')
    end

    scenario 'and unauthenticated user cant see button' do
        visit root_path      
        expect(page).not_to have_content('Minhas receitas')
    end

    scenario 'and unauthenticated user cant acess by route' do
        visit myrecipes_path
        expect(current_path).to eq new_user_session_path
    end

    scenario 'and authenticated user dont have any recipe' do
        user = create(:user)
        login_as(user, :scope => :user)

        visit root_path
        click_on 'Minhas receitas'

        expect(page).to have_content('Você ainda não possui nenhuma receita')
        expect(current_path).not_to eq (myrecipes_path)
    end
end