json.array!(@reviews) do |review|
  json.extract! review, :id, :headline, :content, :overall_rating, :user_id, :batch_id
  json.url review_url(review, format: :json)
end
