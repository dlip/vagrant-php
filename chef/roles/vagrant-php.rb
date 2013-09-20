name "mixjuke-server"

run_list(
    "recipe[apt]",
    "recipe[php]",
    "recipe[apache2]",
    "recipe[apache2::mod_php5]",
    "recipe[mysql]",
    "recipe[mysql::server]",
    "recipe[database::mysql]",
    "recipe[phpmyadmin]"
)

override_attributes(
    "mysql" => {
        "server_root_password" => "vagrant",
        "server_repl_password" => "vagrant",
        "server_debian_password" => "vagrant"
    }
)
