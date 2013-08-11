json.array!(@payers) do |payer|
  json.extract! payer, :payment_id, :treatment_id, :date
  json.url payer_url(payer, format: :json)
end
