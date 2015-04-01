json.array!(@mirrors) do |mirror|
  json.extract! mirror, :id, :mrand_num, :unique_id
  json.url mirror_url(mirror, format: :json)
end
