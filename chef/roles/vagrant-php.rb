name "server"

run_list(
    "recipe[apt]",
    "recipe[php]",
    "recipe[apache2]",
    "recipe[apache2::mod_php5]",
    "recipe[mysql]",
    "recipe[mysql::server]",
    "recipe[database::mysql]",
    "recipe[phpmyadmin]",
    "recipe[xdebug]"
)

override_attributes(
    "mysql" => {
        "server_root_password" => "vagrant",
        "server_repl_password" => "vagrant",
        "server_debian_password" => "vagrant"
    },
    "apache" => {
        "default_site_enabled" => true,
        "docroot_dir" => "/vagrant/web"
    },
    "xdebug" => {
        "remote_enable" => "1",
        "remote_host" => "192.168.33.1"
    }
)
