class ApplicationController < ActionController::Base
  protect_from_forgery
  private
  def client
    Twitter.configure do |config|
      config.consumer_key = 'orpdVK584HAHyekm3I0eFA'
      config.consumer_secret = 'MfEPqv3OrFoyKuh7dFUgYrM5YUT1wnCmyPpjvARzOtk'
      config.auth_token = session['access_token']
      config.auth_token_secret = session['access_secret']
    end
    @client ||= Twitter::Client.new
  end
end
