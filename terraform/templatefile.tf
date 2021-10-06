resource "local_file" "hosts_cfg" {
  //content = templatefile("${path.module}/template/hosts.tpl",
  content = templatefile("${path.module}/hosts.tpl",
  //content = templatefile("/home/viktor/otus-devops/ansible/environments/prod/hosts.tpl",
    {
      host_1 = yandex_compute_instance.wp-app-1.network_interface.0.nat_ip_address
      host_2 = yandex_compute_instance.wp-app-2.network_interface.0.nat_ip_address
    }
  )
  filename = "/home/viktor/otus-devops/ansible/environments/prod/inventory"
}


resource "local_file" "mysql_cluster_fqdn" {
  //content = templatefile("${path.module}/template/hosts.tpl",
  content = templatefile("${path.module}/wp_app.tpl",
  //content = templatefile("/home/viktor/otus-devops/ansible/environments/prod/hosts.tpl",
    {
      mysql_cluster_id = yandex_mdb_mysql_cluster.wp_mysql.host[0].fqdn
    }
  )
  filename = "/home/viktor/otus-devops/ansible/environments/prod/wp-app"
}