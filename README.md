# Serverless Simple Pipeline - Easy way to deploy FaaS on AWS with CI/CD

Create deployment pipelines for NodeJS FaaS using Serverless Framework with Terraform

## Deploy Pipeline

![Steps](.github/images/pipeline-demo.png)

# How to Deploy

## Edit your preferences

Edit `variables.tf` file to customize application preferences like Github account, repo and owner, Load Balancer ports and cluster preferences. 

```hcl
# Customize the Serverless App Name

variable "app_name" {
  description = "Serverless Project Name"
  default     = "serverless-project-demo"
}
```

Edit the Github preferences in the same file to specify infos like repo, owner or organization, branches e etc.

```hcl
# Github Repository Owner
variable "git_repository_owner" {
  description = "Github Repository Owner"
  default     = "msfidelis"
}

# Github Repository Project Name
variable "git_repository_name" {
  description = "Project name on Github"
  default     = "micro-api"
}

# Default Branch
variable "git_repository_branch" {
  description = "Github Project Branch"
  default     = "master"
}
```

## Edit your Build steps

This demo build, test and deploy a simple Node.JS FaaS. Customize your build steps on `modules/pipeline/templates/buildspec.yml` file.

### Example

```yml
version: 0.2

phases:
  pre_build:
    commands:
      - echo Installing Node 8
      - curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
      - apt-get install -y nodejs  
      - echo Entered the pre_build phase...
      - npm install -g serverless
      - npm install
  build:
    commands:
      - echo Build started on `date`
      - echo Starting Unit Tests
      - npm run test # Put your test command code in here
  post_build:
    commands:
      - serverless deploy -v
```


## How to Deploy

### 1) Github Access Token

* Create your Github Access Token to Command Line. [This link have all information about this](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/). 


* Export Github Token as an environment variable. 

```bash
export GITHUB_TOKEN=YOUR_TOKEN
``` 

### 2) Terraform 

* Initialize Terraform 

```bash
terraform init
```

* Plan our modifications

```bash
terraform plan
```

* Apply the changes on AWS

```bash
terraform apply
```

#### References

* [ECS Pipeline](https://github.com/msfidelis/ecs-pipeline)

