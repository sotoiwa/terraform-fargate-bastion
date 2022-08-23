terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      managed_by = local.managed_by
      repo       = local.repo
      env        = local.env
    }
  }
}

data "aws_region" "this" {}

data "aws_caller_identity" "this" {}

data "aws_canonical_user_id" "this" {}

data "aws_availability_zones" "this" {
  state = "available"
}
