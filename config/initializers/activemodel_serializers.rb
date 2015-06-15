ActiveModel::Serializer.setup do |config|
  config.root = false
  config.array_root = "data"
end