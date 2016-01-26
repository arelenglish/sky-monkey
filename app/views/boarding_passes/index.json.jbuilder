json.array!(@boarding_passes) do |boarding_pass|
  json.extract! boarding_pass, :id, :price, :quantity, :tax_paid, :expiration, :is_valid
  json.url boarding_pass_url(boarding_pass, format: :json)
end
