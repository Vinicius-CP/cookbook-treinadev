require 'rails_helper'

feature 'User add recipes on recipe list' do
    scenario 'successfully' do
        user = create(:user)
        recipe_list = create(:recipe_list, user: user)
        recipe = create(:recipe, user:user)
        login_as(user, :scope => :user)

        visit root_path
        click_on recipe.title
        select 'Veggie', from: 'Lista de Receita'
        click_on 'Adicionar'

        expect(current_path).to have_content('Receita adicionada com sucesso!')
    end
end