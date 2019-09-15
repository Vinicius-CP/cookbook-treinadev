require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#recipe_owner?" do 
    it "true" do
      user = create(:user)
      recipe = create(:recipe, user: user)

      expect(user.recipe_owner?(recipe)).to eq(true)
    end

    it 'false'do
      user = create(:user)
      other_user = create(:user, email: 'natan@email.com')
      recipe = create(:recipe, user: other_user)

      expect(user.recipe_owner?(recipe)).to eq(false)
    end
    it "nil" do 
      user = create(:user)
      
      expect(user.recipe_owner?(nil)).to eq(false)
    end
  end
end