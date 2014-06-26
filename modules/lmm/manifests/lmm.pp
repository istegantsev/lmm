class lmm::lmm (

$magnetodb = 'True',
$cassandra = 'True',
$tenant_id = 'blabla',
$brokerlist = 'ip:port,ip:port,ip:port',
$apikey = 'blabla',



)
{


File['logstash'] -> Exec['untar'] -> File['logstash_sym'] -> File['extra']

file {'logstash':
        ensure => 'present',
        path => '/opt/logstash-1.4.0.tar.gz',
        source => "puppet:///modules/lmm/logstash-1.4.0.tar.gz",
     }

exec {'untar':
        path => "/usr/bin/:/bin/:/sbin/:/usr/sbin/",
        command => "bash -c 'cd /opt && tar -xzf ./logstash-1.4.0.tar.gz'",
     }

file { "logstash_sym":
        ensure => symlink,
        path   => "/opt/logstash",
        target => "/opt/logstash-1.4.0"
     }

file { "/etc/profile.d/logstash.sh":
        content => "export LS_HEAP_SIZE='512m'"
     }

file {"extra":
        path => "/opt/logstash/patterns/extra",
        content => template('lmm/extra.erb'),
     }


if $cassandra == 'True'{

file {"logstash_cassandra.conf":
        path => "/opt/logstash/conf/logstash_cassandra.conf",
        content => template('lmm/logstash_cassandra.conf.erb'),
     }
}

if $magnetodb == 'True'{

file {"logstash_magnetodb.conf":
        path => "/opt/logstash/conf/logstash_magnetodb.conf",
        content => template('lmm/logstash_magnetodb.conf.erb'),
     }
}
}




