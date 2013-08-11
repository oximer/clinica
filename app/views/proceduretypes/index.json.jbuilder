json.array!(@proceduretypes) do |proceduretype|
  json.extract! proceduretype, :name, :followup
  json.url proceduretype_url(proceduretype, format: :json)
end
