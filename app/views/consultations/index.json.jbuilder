json.array!(@consultations) do |consultation|
  json.extract! consultation, :treatment_id, :date
  json.url consultation_url(consultation, format: :json)
end
