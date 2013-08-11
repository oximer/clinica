json.array!(@treatments) do |treatment|
  json.extract! treatment, :pacient_id, :procedure_id, :discount, :done
  json.url treatment_url(treatment, format: :json)
end
