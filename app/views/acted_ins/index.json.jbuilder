json.array!(@acted_ins) do |acted_in|
  json.extract! acted_in, :id, :role
  json.url acted_in_url(acted_in, format: :json)
end
