locals {

  sites_available = jsondecode(file("./sites-available.json"))
  dns             = jsondecode(file("./dns.json"))

  container_loop = {
    sites_available  = local.sites_available
    dns              = local.dns
    email_address    = var.email_address
    database_prefix  = "db_"
    wordpress_prefix = "wp_"
  }

  user_data_vars = {
    nginx_conf_base64                  = base64encode(templatefile("./nginx/nginx.conf", local.container_loop))
    nginx_config_php_conf_base64       = base64encode(templatefile("./nginx/nginxconfig.io/php_fastcgi.conf", local.container_loop))
    nginx_config_general_conf_base64   = base64encode(file("./nginx/nginxconfig.io/general.conf"))
    nginx_config_security_conf_base64  = base64encode(file("./nginx/nginxconfig.io/security.conf"))
    nginx_config_wordpress_multisite_conf_base64  = base64encode(file("./nginx/nginxconfig.io/wordpress-multisite.conf"))
    # nginx_dockerfile                   = base64encode(file("./nginx/Dockerfile"))
    public_ssh_key                     = var.public_ssh_key
    root_temporary_password            = var.root_temporary_password
    tmp_folder_path                    = var.tmp_folder_path
    user_full_name                     = var.user_full_name
    user_temporary_password            = var.user_temporary_password
    username                           = var.username
    # wordpress_dotenv_base64            = base64encode(file("./.env"))
  }
}
