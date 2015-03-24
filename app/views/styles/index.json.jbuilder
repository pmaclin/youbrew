json.array!(@styles) do |style|
  json.extract! style, :id, :name, :std_flavor_profile, :com_ex_image
  json.url style_url(style, format: :json)
end
