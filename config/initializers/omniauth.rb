Rails.application.config.middleware.use OmniAuth.builder do
  use OmniAuth::Strategies::Twitter , 'orpdVK584HAHyekm3I0eFA','MfEPqv3OrFoyKuh7dFUgYrM5YUT1wnCmyPpjvARzOtk'
end
