resource "aws_ecr_repository" "this" {
  name                 = "ecs-cluster-repo"
  image_tag_mutability = "IMMUTABLE_WITH_EXCLUSION"
  force_delete         = true

  image_tag_mutability_exclusion_filter {
    filter      = "latest"
    filter_type = "WILDCARD"
  }
}