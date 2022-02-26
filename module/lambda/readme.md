# Lambda
Create a kafka consumer lambda.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.consumer_lambda_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.logs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.secrets_getter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.vpc_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_lambda_event_source_mapping.event_source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping) | resource |
| [aws_lambda_function.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Lambda function name | `string` | `"kafka-consumer"` | no |
| <a name="input_kafka_authentication_type"></a> [kafka\_authentication\_type](#input\_kafka\_authentication\_type) | The authentication to perform to connect to kafka. Possible values are: "BASIC" or "mTLS". | `string` | n/a | yes |
| <a name="input_kafka_batch_size"></a> [kafka\_batch\_size](#input\_kafka\_batch\_size) | The largest number of records that Lambda will retrieve from each kafka topic | `number` | `10` | no |
| <a name="input_kafka_ca_secret_arn"></a> [kafka\_ca\_secret\_arn](#input\_kafka\_ca\_secret\_arn) | The arn of the secret containing the ca certificate in PEM format | `string` | `""` | no |
| <a name="input_kafka_credentials_arn"></a> [kafka\_credentials\_arn](#input\_kafka\_credentials\_arn) | The arn of the secret containing the kafka credentials. The content dependes on the "kafka\_authentication\_type" var. | `string` | `""` | no |
| <a name="input_kafka_endpoints"></a> [kafka\_endpoints](#input\_kafka\_endpoints) | Comma separated kafka endpoints <ip>:<port> | `string` | n/a | yes |
| <a name="input_kafka_sg_ids"></a> [kafka\_sg\_ids](#input\_kafka\_sg\_ids) | List of security group id to access kafka | `list(string)` | `[]` | no |
| <a name="input_kafka_starting_position"></a> [kafka\_starting\_position](#input\_kafka\_starting\_position) | The position in the stream where AWS Lambda should start reading. Supported values are: LATEST, TRIM\_HORIZON | `string` | `"TRIM_HORIZON"` | no |
| <a name="input_kafka_subnet_ids"></a> [kafka\_subnet\_ids](#input\_kafka\_subnet\_ids) | List of subnets ids to use for the kafka event source | `list(string)` | `[]` | no |
| <a name="input_kafka_topics"></a> [kafka\_topics](#input\_kafka\_topics) | Kafka topics definition | <pre>list(object({<br>    topic_name = string<br>    is_avro    = bool<br>  }))</pre> | n/a | yes |
| <a name="input_log_group_retention_days"></a> [log\_group\_retention\_days](#input\_log\_group\_retention\_days) | Cloudwatch log group retention in days | `number` | `30` | no |
| <a name="input_schema_registry_credentials_arn"></a> [schema\_registry\_credentials\_arn](#input\_schema\_registry\_credentials\_arn) | Secret containing the username and password to connect to schema registry | `string` | `""` | no |
| <a name="input_schema_registry_endpoint"></a> [schema\_registry\_endpoint](#input\_schema\_registry\_endpoint) | Schema registry endpoint including the protocol (i.e. https://...). | `string` | `""` | no |

## Outputs

No outputs.