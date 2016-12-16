server '52.192.134.213', user: 'admin', roles: %w{app db web}

set :ssh_options, keys: '~/.ssh/twitter_key_rsa'
