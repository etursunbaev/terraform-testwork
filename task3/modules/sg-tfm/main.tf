locals {
    common_tags = {
        Department = var.departament_name
        ManagedByTerraform = "True"
        Environment = var.environment
    }
    sg_id = var.create_sg ? concat(aws_security_group.this_sg.*.id, [""])[0] : var.security_group_id
}

data "aws_vpc" "vpc" {
    id = var.vpc_id
}
data "http" "home_ip" {
    url = var.data_http_ip_url
}
############################ Resources
resource "aws_security_group" "this_sg" {
    count = var.create && var.create_sg ? 1 : 0
    name = format("${var.prefix_name}-${var.environment}-%03d", count.index + 1)
    description = var.sg_description
    vpc_id = data.aws_vpc.vpc.id
    revoke_rules_on_delete = var.revoke_rules_on_delete
    tags = merge(local.common_tags,{
        Name = format("${var.prefix_name}-${var.environment}-sg-%03d", count.index + 1)
        },
    )
}
resource "aws_security_group_rule" "ingress_rules" {
for_each = {for rule in var.ingress_rules : rule.description => rule}
type = "ingress"
from_port = each.value.from_port
to_port = each.value.to_port
protocol = each.value.protocol
cidr_blocks = [each.value.cidr_blocks]
description = each.value.description
security_group_id = local.sg_id
}
resource "aws_security_group_rule" "egress_rules" {
for_each = {for rule in var.egress_rules_default : rule.description => rule}
type = "egress"
from_port = each.value.from_port
to_port = each.value.to_port
protocol = each.value.protocol
cidr_blocks = [each.value.cidr_blocks]
description = each.value.description
security_group_id = local.sg_id
}
