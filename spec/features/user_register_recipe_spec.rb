require 'rails_helper'

feature 'User register recipe' do
    scenario 'successfully' do

        visit root_path
        click_on 'Cadastrar receita'

        fill_in 'Título', with: 'Vinagrete'
        fill_in 'Tipo da receita', with: 'Salada'
        fill_in 'Cozinha', with: 'Brasileira'
        fill_in 'Dificuldade', with: 'Fácil'
        fill_in 'Tempo de preparo', with: '15'
        fill_in 'Ingredientes', with: 'Tomate, alface, cebola e vinagre'
        fill_in 'Método de preparo', with: 'Adicione tomate, alface, cebola, um pouco de sal e vinagre'
        click_on 'Enviar'

        expect(page).to have_css('h1', text: 'Vinagrete')
        expect(page).to have_css('p', text: 'Salada')
        expect(page).to have_css('p', text: 'Brasileira')
        expect(page).to have_css('p', text: 'Fácil')
        expect(page).to have_css('p', text: '15')
        expect(page).to have_css('p', text: 'Tomate, alface, cebola e vinagre')
        expect(page).to have_css('p', text: 'Adicione tomate, alface, cebola, um pouco de sal e vinagre')
        expect(page).to have_content('Receita criada com sucesso!')   
    end

    scenario 'and must fill in all fields' do
        visit root_path
        click_on 'Cadastrar receita'

        fill_in 'Título', with: ''
        fill_in 'Tipo da receita', with: 'Salada'
        fill_in 'Cozinha', with: 'Brasileira'
        fill_in 'Dificuldade', with: 'Fácil'
        fill_in 'Tempo de preparo', with: '15'
        fill_in 'Ingredientes', with: 'Tomate, alface, cebola e vinagre'
        fill_in 'Método de preparo', with: 'Adicione tomate, alface, cebola, um pouco de sal e vinagre'
        click_on 'Enviar'

        expect(page).to have_content('Os campos devem ser preenchidos') 
    end
end 