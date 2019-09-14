require 'rails_helper'

feature 'User authenticates to the site' do
    scenario 'successfully log in' do
        user = create(:user)

        visit root_path
        click_on 'Entrar'

        within('form') do
            fill_in 'Email', with: 'vini@email.com'
            fill_in 'Senha', with: '123456'
            click_on 'Entrar'
        end

        expect(current_path).to eq (root_path)
        expect(page).not_to have_link('Entrar')
        expect(page).to have_link('Sair')

    end
end