server '52.199.252.52', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/harukatezuka/.ssh/id_rsa'
