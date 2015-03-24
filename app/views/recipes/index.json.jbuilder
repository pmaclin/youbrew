json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :brew_type, :description, :tog, :tfg, :tabv, :taroma, :tibu, :label, :tflavpro, :user_id, :style_id
  json.url recipe_url(recipe, format: :json)
end
