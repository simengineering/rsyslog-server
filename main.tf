data "http" "my_ip" {
  url = "http://ifconfig.me/ip"
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "oci_core_network_security_group" "temp" {

  compartment_id = var.compartment_id
  display_name   = "rsyslog-server-nsg"
  vcn_id         = var.vcn_id
}

resource "oci_core_network_security_group_security_rule" "this" {
  depends_on = [oci_core_network_security_group.temp]

  network_security_group_id = oci_core_network_security_group.temp.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source_type               = "CIDR_BLOCK"
  source                    = "${data.http.my_ip.body}/32"
  description               = "Ingress NSG Rule - Access to Rsyslog server"

  tcp_options {
    destination_port_range {
      max = 22
      min = 22
    }
  }
}

module "rsyslog_server" {
  source = "../../../components/instance"
  depends_on = [
    oci_core_network_security_group.temp,
    tls_private_key.this
  ]

  root_compartment_id   = var.root_compartment_id
  compartment_name      = "cmp-af-c1-app-${var.env_abbr}"
  net_compartment       = "cmp-af-c1-net-${var.env_abbr}"
  display_name          = "rsyslog-server"
  subnet_display_name   = "snet-af-c1-dmz-${var.env_abbr}-${var.region_abbr}"
  nsg_name              = oci_core_network_security_group.temp.display_name
  operating_system      = "linux"
  private_ip_last_octet = "201"
  pub_ip                = true
  pubkey                = tls_private_key.this.public_key_openssh
  userdata              = base64encode(file("./data/rsyslog.sh"))
}
