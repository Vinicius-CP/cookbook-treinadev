FactoryBot.define do
    factory :recipe do
        title {'Vinagrete'}
        cuisine {'Brasileira'}
        difficulty {'Fácil'}
        cook_time {15}
        ingredients {'Tomate, alface, cebola e vinagre'}
        cook_method {'Adicione tomate, alface, cebola, um pouco de sal e vinagre'}  
             
        recipe_type
        user
    end
end
