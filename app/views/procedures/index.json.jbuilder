json.array!(@procedures) do |procedure|
  json.extract! procedure, :proceduretype_id, :insurance_id, :name, :description, :value, :followup
  json.url procedure_url(procedure, format: :json)
end
