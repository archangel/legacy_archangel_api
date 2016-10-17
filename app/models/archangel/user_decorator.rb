Archangel::User.class_eval do
  # API token
  has_secure_token :api_token
end
