json.array!(@insureds) do |insured|
  json.extract! insured, :pacient_id, :insurance_id
  json.url insured_url(insured, format: :json)
end
