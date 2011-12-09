class nodejs ( $use_ppa = false, $lastversion=false ) {
    
    # parameters validation
    if ($use_ppa != true) and ($use_ppa != false) {
        fail("use_ppa must be true or false")
    }
    if ($lastversion != true) and ($lastversion != false) {
        fail("lastversion must be true or false")
    }

    include repo
    
    include nodejs::params, nodejs::install
}