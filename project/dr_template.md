| # Infrastructure             |                              |                                                                          |                                                                   |                                                                                                                |
|------------------------------|------------------------------|--------------------------------------------------------------------------|-------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| ## AWS Zones                 |                              |                                                                          |                                                                   |                                                                                                                |
| Identify your zones here     |                              |                                                                          |                                                                   |                                                                                                                |
| us-east-2a                   |                              |                                                                          |                                                                   |                                                                                                                |
| us-east-2b                   |                              |                                                                          |                                                                   |                                                                                                                |
| us-east-2c                   |                              |                                                                          |                                                                   |                                                                                                                |
| us-west-1a                   |                              |                                                                          |                                                                   |                                                                                                                |
| us-west-1b                   |                              |                                                                          |                                                                   |                                                                                                                |
|                              |                              |                                                                          |                                                                   |                                                                                                                |
|                              |                              |                                                                          |                                                                   |                                                                                                                |
| ### Table 1.1 Summary        |                              |                                                                          |                                                                   |                                                                                                                |
| Asset                        | Purpose                      | Size                                                                     | Qty                                                               | DR                                                                                                             |
| ------------                 | -------------------          | ------------------------------------------------------------------------ | ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Asset name                   | Brief description            | AWS size eg. t3.micro (if applicable, not all assets will have a size)   | Number of nodes/replicas or just how many of a particular asset   | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere   |
| Ubuntu-Web                   | EC2 Node                     | t2.micro                                                                 | 3                                                                 | Implemented in Primary (us-east-2)                                                                             |
| Ubuntu-Web                   | EC2 Node                     | t2.micro                                                                 | 3                                                                 | Implemented in DR (us-west-1)                                                                                  |
| udacity-db-cluster           | RDS Cluster with 2 instances | Aurora MySQL                                                             | 1                                                                 | Implemented in Primary (us-east-2)                                                                             |
| udacity-db-cluster           | RDS Cluster with 2 instances | Aurora MySQL                                                             | 1                                                                 | Implemented in DR (us-west-1)                                                                                  |
| VPC with IPs in Multiple AZs | VPC                          | VPC                                                                      | 1                                                                 | Implemented in Primary (us-east-2)                                                                             |
| VPC with IPs in Multiple AZs | VPC                          | VPC                                                                      | 1                                                                 | Implemented in DR (us-west-1)                                                                                  |
|                              |                              |                                                                          |                                                                   |                                                                                                                |

## Describtion
Primary Ubuntu Web: EC2 Node with the hosted application with a skew of t3.micro and exists in us-east-2.
Secondry Ubuntu Web: EC2 Node with the hosted application with a skew of t3.micro and exists in us-west-1. This will be the nodes where the ALB will fail over to in case the primary application is down.
Primary udacity-db-cluster : The primary RDS database cluster which contains two instances. It's an Auroro MySQL DB and it exists in us-east-2. This will be the DB cluster where the ALB will fail over to in case the primary cluster is down.
Secondry udacity-db-cluster : The secondry RDS database cluster which contains two instances. It's an Auroro MySQL DB and it exists in us-west-1..
Primary VPC: A VPC with IPs in Multiple AZs (us-east-2a - us-east-2b - us-east-2c).
Secondry VPC: A VPC with IPs in Multiple AZs (us-west-1a - us-west-1b).



## DR Plan
### Pre-Steps:
Both sites are configured the same
We use infrastructure as code (IaC) to do this 

## Steps:
Point DNS to secondary region
This can be done with a name provider like Amazon route 53
Failover database replication instances to another region
Manually force the secondary region to become primary at the database level, or automatically failover the database by health checks
