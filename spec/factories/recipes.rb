FactoryBot.define do
    factory :recipe do
        title {'Vinagrete'}
        recipe_type {'Salada'}
        cuisine {'Brasileira'}
        difficulty {'Fácil'}
        cook_time {15}
        ingredients {'Tomate, alface, cebola e vinagre'}
        cook_method {'Adicione tomate, alface, cebola e um pouco de sal e vinagre'}
    end
end
