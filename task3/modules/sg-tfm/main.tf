# Resources
resource "aws_security_group" "this_sg" {
    count = var.create_sg ? var.sg_count : 0
    name = format("${var.prefix_name}-${var.environment}-%03d", count.index + 1)
    description = var.sg_description
    vpc_id = var.vpc_id != "" ? var.vpc_id : var.default_vpc_id
    #revoke_rules_on_delete = var.revoke_rules_on_delete
    tags = merge(var.additional_tags,{
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
    security_group_id = aws_security_group.this_sg[*].id
}
resource "aws_security_group_rule" "egress_rules" {
    for_each = {for rule in var.egress_rules : rule.description => rule}
    type = "egress"
    from_port = each.value.from_port
    to_port = each.value.to_port
    protocol = each.value.protocol
    cidr_blocks = [each.value.cidr_blocks]
    description = each.value.description
    security_group_id = aws_security_group.this_sg[*].id
}