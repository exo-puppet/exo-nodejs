class nodejs::install {

    case $::operatingsystem {
        /(Ubuntu)/: {
            
            if ($nodejs::use_ppa == true ) {
                repo::define { "nodejs-chris-lea-ppa-repo":
                    file_name   => "nodejs-chris-lea-ppa",
                    url         => "http://ppa.launchpad.net/chris-lea/node.js/ubuntu",
                    sections    => ["main"],
                    source      => true,
                    key         => "C7917B12",
                    key_server  => "keyserver.ubuntu.com",
                    notify      => Exec["repo-update"],
                }
                package { "nodejs":
                    name    => $nodejs::params::package_name,
                    ensure  => $nodejs::lastversion ? {
                        true    => latest,
                        default => present,
                    },
                    require => [ Repo::Define [ "nodejs-chris-lea-ppa-repo" ], Exec["repo-update"] ],
                }
            } else {
                package { "nodejs":
                    name    => $nodejs::params::package_name,
                    ensure  => $nodejs::lastversion ? {
                        true    => latest,
                        default => present,
                    },
                    require => [ Exec["repo-update"] ],
                }
            }
        }
    }

}