json.array!(@classification_funds) do |classification_fund|
  json.extract! classification_fund, :id
  json.url classification_fund_url(classification_fund, format: :json)
end
