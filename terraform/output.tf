output "load_balancer_public_ip" {
  description = "Public IP address of load balancer"
  value = yandex_lb_network_load_balancer.wp_lb.listener.*.external_address_spec[0].*.address
}

output "database_host_fqdn" {
  description = "DB hostname"
  value = local.dbhosts
}

output "server_1_public_ip" {
  description = "Public IP address of server #1"
  value = yandex_compute_instance.wp-app-1.network_interface.0.nat_ip_address
}

output "server_2_public_ip" {
  description = "Public IP address of server #2"
  value = yandex_compute_instance.wp-app-2.network_interface.0.nat_ip_address
}

output "mysql_cluster_net_id" {
  description = "MySQL server FQDN"
  value = yandex_mdb_mysql_cluster.wp_mysql.network_id
}

output "mysql_cluster_fqdn" {
  description = "MySQL server FQDN"
  value = yandex_mdb_mysql_cluster.wp_mysql.host.0.fqdn
}