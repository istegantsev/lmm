node default {

class {'lmm::lmm':
magnetodb => 'True', #stay ebabled for lmm logging configuration for magnetdodb
cassandra => 'True', #stay ebabled for lmm logging configuration for cassandra
tenant_id => 'blabla', #Tennat ID
apikey => 'blabla', #Api key
brokerlist => '10.50.130.47:9092,10.50.132.47:9092,10.50.130.48:9092,10.50.132.48:9092,10.50.130.49:9092' # list of kaffka comma separated ips with ports.

}
}
