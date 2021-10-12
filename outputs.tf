output "public_ip" {
  description = "The public ip of the temporary remote bastion"
  value       = module.remote_bastion.public_ip
}

output "private_ip" {
  description = "The private ip of the instance"
  value       = module.remote_bastion.instance_ip
}

output "priv_key" {
  description = "The private key needed to connect to the remote bastion. In PEM format."
  value       = tls_private_key.this.private_key_pem
  sensitive   = true
}

output "nsg_id" {
  description = "The ID of the temporary NSG that was deployed for this standup."
  value       = oci_core_network_security_group.temp.id
}
