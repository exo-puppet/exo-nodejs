class nodejs::params {

    case $::operatingsystem {
        /(Ubuntu|Debian)/: {
            if ($nodejs::use_ppa == true ) {            
                $package_name   = ["nodejs","npm"]
            } else {
                $package_name   = "nodejs"
            }
        }
    }
}