json.array!(@unis) do |uni|
  json.extract! uni, :id, :rand_num, :batch_id, :user_id
  json.url uni_url(uni, format: :json)
end
