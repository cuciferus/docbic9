OmniAuth.config.full_host = "http://localhost:3000"
Rails.application.config.middleware.use OmniAuth::Builder do
  #use OmniAuth::Strategies::Twitter , 'orpdVK584HAHyekm3I0eFA','MfEPqv3OrFoyKuh7dFUgYrM5YUT1wnCmyPpjvARzOtk'
  provider :google, 'domain.com', 'oauth_secret', :identifier => 'https://www.google.com/accounts/o8/id'
end
