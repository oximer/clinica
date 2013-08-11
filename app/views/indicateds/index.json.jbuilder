json.array!(@indicateds) do |indicated|
  json.extract! indicated, :indication_id, :description
  json.url indicated_url(indicated, format: :json)
end
