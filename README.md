<p align="center">
  <a href="https://www.cloud42.io/" target="_blank" rel="Homepage">
  <img width="200" height="200" src="https://www.cloud42.io/wp-content/uploads/2020/01/transparent_small.png">
  </a>
</p>

---
<p align="center">Need help with your Cloud builds <a href="https://www.cloud42.io/contact/" target="_blank" rel="ContactUS"> DROP US A LINE</a>.</p>

---
# terraform-aws-efs
Creates a multi-az, EFS cluster.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.5 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| deletion\_window\_in\_days | Duration in days after which the key is deleted after destruction of the resource | `number` | `30` | no |
| environment | Environment id. UAT, TEST, PRD, etc | `string` | n/a | yes |
| kms\_alias\_name | KMS alias name to use | `string` | `"alias/efs"` | no |
| performance\_mode | EFS performance mode.https://docs.aws.amazon.com/efs/latest/ug/performance.html | `string` | `"generalPurpose"` | no |
| security\_group\_subnet\_a | Security group to assign to mount point in subnet a | `list(string)` | n/a | yes |
| security\_group\_subnet\_b | Security group to assign to mount point in subnet a | `list(string)` | n/a | yes |
| subnet\_a | 1st subnet id into which EFS is deployed | `string` | n/a | yes |
| subnet\_b | 2nd subnet id into which EFS is deployed | `string` | n/a | yes |
| tags | Tags map | `map(string)` | `{}` | no |
| vpc\_id | VPC id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| efs\_dns\_name | DNS name of the EFS share |
