require 'rails_helper'

feature 'Admin register recipe type' do 
    scenario 'successfully' do
        visit root_path
        click_on 'Cadastrar tipo da receita'

        fill_in 'Tipo de receita', with: 'Salada'
        click_on 'Criar Tipo da Receita'

        expect(page).to have_css('h3', text: 'Salada')
        expect(page).to have_content('Tipo da receita criada com sucesso!')
    end

    scenario 'and must fill in all fields' do
        visit root_path
        click_on 'Cadastrar tipo da receita'

        fill_in 'Tipo de receita', with: ''
        click_on 'Criar Tipo da Receita'

        expect(page).to have_content('Tipo de receita não pode ficar em branco')
    end

    scenario 'and recipe type name must be unique' do
        recipe_type = create(:recipe_type)
        
        visit root_path
        click_on 'Cadastrar tipo da receita'

        fill_in 'Tipo de receita', with: recipe_type.name
        click_on 'Criar Tipo da Receita'

        expect(page).to have_content('Tipo de receita já está em uso')
    end

end