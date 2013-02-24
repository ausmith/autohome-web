Airbrake.configure do |config|
  config.api_key = '60bcd0e4c62a73775bf335c80f8c7fd6'
  config.host    = 'errbit.btdev.org'
  config.port    = 80
  config.secure  = config.port == 443
end
