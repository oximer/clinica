json.array!(@indications) do |indication|
  json.extract! indication, :name
  json.url indication_url(indication, format: :json)
end
