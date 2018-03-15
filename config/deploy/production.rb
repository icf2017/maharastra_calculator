set :stage, :production

server ENV['IESS_PRODUCTION_ENDPOINT'], user: 'root', roles: %w{app db web}