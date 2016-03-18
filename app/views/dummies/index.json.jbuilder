json.array!(@dummies) do |dummy|
  json.extract! dummy, :id, :name
  json.url dummy_url(dummy, format: :json)
end
