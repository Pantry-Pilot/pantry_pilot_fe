Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '839770501139-u3i2n0rfaj13uf4uk7am2g3gsjt1nctu.apps.googleusercontent.com', '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'
end