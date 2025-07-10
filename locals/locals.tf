locals {
  project_info = "${var.project_name}.${var.env}.${var.component}"

  ec2_tags_info=merge(
    var.common_tags,
    {
        environment = "dev"
        version = "1.1.0"
    }
  )
}