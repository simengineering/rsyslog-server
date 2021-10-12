# Remote_bastion Module

This module creates a remote bastion to assist in deploying ansible configuration in the event the terraform script is being run external to the C1 enclave.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_oci"></a> [oci](#provider\_oci) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_remote_bastion"></a> [remote\_bastion](#module\_remote\_bastion) | ../../../components/instance | n/a |

## Resources

| Name | Type |
|------|------|
| [oci_core_network_security_group.temp](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group) | resource |
| [oci_core_network_security_group_security_rule.this](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [http_http.my_ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | The compartment id for the NSG. | `any` | n/a | yes |
| <a name="input_env_abbr"></a> [env\_abbr](#input\_env\_abbr) | The environment abbreviation for the deplooyment. e.g. znc for Zone C. | `any` | n/a | yes |
| <a name="input_region_abbr"></a> [region\_abbr](#input\_region\_abbr) | The region abbreviation for the deployment. e.g. de for dod east. | `any` | n/a | yes |
| <a name="input_root_compartment_id"></a> [root\_compartment\_id](#input\_root\_compartment\_id) | The root compartment/tenancy id. used to find the compartments ids the instance will be deployed in. | `any` | n/a | yes |
| <a name="input_vcn_id"></a> [vcn\_id](#input\_vcn\_id) | The VCN id where the NSG will be deployed | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg_id"></a> [nsg\_id](#output\_nsg\_id) | The ID of the temporary NSG that was deployed for this standup. |
| <a name="output_priv_key"></a> [priv\_key](#output\_priv\_key) | The private key needed to connect to the remote bastion. In PEM format. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | The private ip of the instance |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public ip of the temporary remote bastion |
<!-- END_TF_DOCS -->
