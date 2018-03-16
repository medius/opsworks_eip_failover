default[:eip_failover][:port] = 80
default[:eip_failover][:protocol] = "HTTP"
default[:eip_failover][:request_path] = "/"
default[:eip_failover][:timeout] = 30 # seconds
default[:eip_failover][:cycles] = 2 # consecutive failures
