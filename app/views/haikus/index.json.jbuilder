json.array!(@haikus) do |haiku|
  json.extract! haiku, :id, :line1, :line2, :line3, :likes, :compGen
  json.url haiku_url(haiku, format: :json)
end
