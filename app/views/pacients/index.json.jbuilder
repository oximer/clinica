json.array!(@pacients) do |pacient|
  json.extract! pacient, :name, :address, :email, :rg, :cpf
  json.url pacient_url(pacient, format: :json)
end
