define nodejs::npm-update ($path, $user) {
    info("Executes npm update into $path with user $user")
    exec {
        "npm-update-${path}" :
            command => "npm install --userconfig /home/$user/.npmrc --cache /home/$user/.npm --user $user",
            path => "/usr/bin",
            cwd => "$path",
            user => "$user",
            group => "$user",
            environment => ["HOME=/home/$user"],
            logoutput => "true",
            require => [File["$path"],Class["nodejs::install"]],
    } 
}