module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.2.0"

  cluster_name    = "ecommerce-cluster-v4"
  cluster_version = "1.30" # A recent, stable version of Kubernetes

 
  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  # Set up the worker nodes (the EC2 servers that will run our Docker containers)
  eks_managed_node_groups = {
    # We create a single node group called "general"
    general = {
      desired_size = 2 # We want 2 servers
      min_size     = 1
      max_size     = 3

      # We use t3.small to keep costs as low as possible while still having enough memory
      instance_types = ["t3.small"]
    }
  }

  tags = {
    Environment = "dev"
    Project     = "ecommerce-microservices"
  }
}
