class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  
  attributes :description, :url, :credits
end
