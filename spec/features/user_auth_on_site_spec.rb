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

    scenario 'successfully log out' do
        user = create(:user)
        login_as(user, :scope => :user)

        visit root_path
        click_on 'Sair'

        expect(current_path).to eq(root_path)
        expect(page).not_to have_link('Sair')
        expect(page).to have_link('Entrar')
    end
end