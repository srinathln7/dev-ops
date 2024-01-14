# ci-cd-test
A simple "CI-CD" pipeline integrated with AWS


## Create AWS ECR Repository
- Go to AWS console, search for ecr
- Create private ECR repository `ci-cd-test`

##  Create AWS IAM User, Policy, and Group

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "GetAuthorizationToken",
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:GetDownloadUrlForLayer",
        "ecr:InitiateLayerUpload",
        "ecr:PutImage",
        "ecr:UploadLayerPart",
        "ecs:DescribeTaskDefinition",
        "ecs:DescribeServices",
        "ecs:UpdateService"
      ],
      "Resource": [
         "arn:aws:ecr:us-east-1:975050170485:repository/ci-cd-test"
      ]
    }
  ]
}

```

This JSON policy file defines an AWS Identity and Access Management (IAM) policy that grants specific permissions related to Amazon Elastic Container Registry (ECR). Here's a breakdown of what each section of the policy does:

### Version and Statement:

Version: Specifies the version of the policy language. In this case, it uses version "2012-10-17," which is the current version as of the provided information.
Statement: An array containing one or more individual statements that define the permissions.
GetAuthorizationToken:

Sid: A unique identifier for the statement. In this case, it's named "GetAuthorizationToken."
Effect: Specifies whether the statement allows or denies the specified actions. Here, it's set to "Allow."
Action: Lists the specific AWS actions allowed by this statement. It grants permission for the "ecr:GetAuthorizationToken" action, which is necessary for authenticating Docker clients to the ECR registry.
Resource: Specifies the AWS resource or resources to which the statement applies. In this case, it allows the action on all resources ("*").
ECR Image Operations:

Another statement that allows a set of ECR actions but restricts them to a specific ECR repository (arn:aws:ecr:us-east-1:424432388155:repository/lesson-086).
The allowed actions include various ECR image-related operations:

```
ecr:BatchGetImage
ecr:BatchCheckLayerAvailability
ecr:CompleteLayerUpload
ecr:GetDownloadUrlForLayer
ecr:InitiateLayerUpload
ecr:PutImage
ecr:UploadLayerPart
ecs:DescribeTaskDefinition,
ecs:DescribeServices,
ecs:UpdateService

```

Effect is set to "Allow."

To extend the permissions to not only push images to Amazon ECR but also deploy them to Amazon ECS clusters, you need to grant the necessary ECS-related permissions in addition to the existing ECR permissions. 

Added ECS actions to the existing statement:

```
ecs:DescribeTaskDefinition: Allows describing ECS task definitions.
ecs:DescribeServices: Allows describing ECS services.
ecs:UpdateService: Allows updating ECS services, which includes deploying new task definitions.
```

Ensure that the ECS-related actions (ecs:DescribeTaskDefinition, ecs:DescribeServices, and ecs:UpdateService) are added to the statement for the specific ECR repository to grant the user the ability to deploy the latest image to ECS clusters associated with that repository. In summary, this policy grants the necessary permissions for Docker clients to authenticate with the ECR service by allowing the ecr:GetAuthorizationToken action globally. Additionally, it allows a specific set of image-related actions (ecr:BatchGetImage, ecr:BatchCheckLayerAvailability, etc.) but only for a specific ECR repository. This level of granularity ensures that the permissions are scoped to the required actions and resources.