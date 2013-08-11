json.array!(@telephones) do |telephone|
  json.extract! telephone, :pacient_id, :ddd, :number, :preferred
  json.url telephone_url(telephone, format: :json)
end
