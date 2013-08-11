json.array!(@insurances) do |insurance|
  json.extract! insurance, :name, :description
  json.url insurance_url(insurance, format: :json)
end
