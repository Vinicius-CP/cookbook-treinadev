require 'rails_helper'

feature 'Admin register recipe type' do 
    scenario 'successfully' do
        visit root_path
        click_on 'Cadastrar tipo da receita'

        fill_in 'Tipo da receita', with: 'Salada'
        click_on 'Criar Tipo da Receita'

        expect(page).to have_css('h3', text: 'Salada')
        expect(page).to have_content('Tipo da receita criada com sucesso!')
    end
end