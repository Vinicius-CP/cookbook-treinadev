require 'rails_helper'

feature 'User creates a recipe list' do
    scenario 'successfully' do
        user = create(:user)
        login_as(user, :scope => :user)

        visit root_path

        click_on 'Criar lista'
        fill_in 'Nome', with: 'Receitas Veggie'
        click_on 'Criar Lista de Receita'

        expect(page).to have_css('h6', text: 'Receitas Veggie')
        expect(page).to have_content('Lista de Receita criada com sucesso!')
    end

    scenario "and see your recipe lists" do
        user = create(:user)
        list = create(:recipe_list, user: user)
        other_user = create(:user, email: 'natan@email.com')
        other_list = create(:recipe_list, name: 'Veggies', user: other_user)

        login_as(user, :scope => :user)

        visit root_path
        click_on 'Minhas listas'

        expect(page).to have_css('h6', text: list.name)
        expect(page).not_to have_css('h6', text: other_list.name)
      end
end