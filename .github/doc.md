# Build and Push Golang Image to AWS ECR

## Overview

This GitHub Actions workflow automates the process of building a Golang application, versioning it, and pushing the Docker image to AWS Elastic Container Registry (ECR) when changes are pushed to the `main` branch.

## Workflow Details

### Trigger

The workflow is triggered on every push and pull request to the `main` branch.

```yaml
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]  
```

### Jobs

#### Build and Push

- **Name:** Build and Push to ECR
- **Runs on:** ubuntu-latest

##### Steps

1. **Checkout Repository:**
   - Uses the `actions/checkout@v2` action to fetch the repository's content.

2. **Configure AWS Credentials:**
   - Uses the `aws-actions/configure-aws-credentials@v1` action to configure AWS credentials.

3. **Login to Amazon ECR:**
   - Uses the `aws-actions/amazon-ecr-login@v1` action to authenticate with the specified ECR registry.

4. **Automatic Tagging of Releases:**
   - Executes a custom script (`git_update.sh`) to automatically update the version tag.

5. **Build, Tag, and Push the Image to Amazon ECR:**
   - Builds a Docker image from the source code, tags it with the version obtained from the previous step, and then pushes it to the specified ECR repository.

```yaml
docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
```

### Usage

To use this workflow, ensure that the necessary secrets (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) are configured in your GitHub repository. Also, have a custom versioning script (`git_update.sh`) in your project.

Upon pushing changes to the `main` branch, the workflow will automatically build and push the Docker image to AWS ECR.

Feel free to customize the workflow to fit your project's structure and requirements. You can add more details or customize it further based on your specific project requirements.