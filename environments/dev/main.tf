
# =========================
# VPC MODULE
# =========================

module "vpc" {
  source = "../../modules/vpc"

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  availability_zones = var.availability_zones

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "terraform-aws-project"
  }
}

# =========================
# EC2 MODULE
# =========================

module "ec2" {
  source = "../../modules/ec2"

  environment = var.environment

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.public_subnet_ids

  instance_type  = var.instance_type
  instance_count = var.instance_count

  key_name         = var.key_name
  allowed_ssh_cidr = var.allowed_ssh_cidr

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "terraform-aws-project"
  }
}

# =========================
# S3 MODULE
# =========================

module "s3" {
  source = "../../modules/s3"

  bucket_name = var.bucket_name

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "terraform-aws-project"
  }
}
