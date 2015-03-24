json.array!(@batches) do |batch|
  json.extract! batch, :id, :size, :brew_date, :bottle_date, :aog, :afg, :aabv, :aaroma, :aibu, :image, :aflavpro, :user_id, :recipe_id
  json.url batch_url(batch, format: :json)
end
